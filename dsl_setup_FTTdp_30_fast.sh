#!/bin/sh

bindir=/opt/lantiq/bin
nLineAll=-1

dsl()
{
	local cmd=$@
	echo dsl_pipe $cmd
	${bindir}/dsl_pipe $cmd
}

setup_dsl()
{
	echo "Configure DSL modes 30A fast mode"

	#Enabled auto-recovery
	dsl AutoRecoveryConfigSet 1 24 -1 7f 1
	# Configure DSL modes 30A ReTx
	dsl TcLayerConfigSet $nLineAll 0 4
	dsl LineReinitTriggerConfigSet $nLineAll 1 7
	dsl LineReinitTriggerConfigSet $nLineAll 0 7
	# line driver
	dsl LowLevelLineConfigSet $nLineAll 8 4
	dsl HardwareCalibrationConfigSet $nLineAll 0 0 256 256
	dsl G997_XTUSystemEnablingConfigSet $nLineAll 0 0 0 0 0 0 0 1 0
	dsl G997_ChannelConfigSet $nLineAll 0 0 32000 100000000 1 0 2 0 1 0
	dsl G997_ChannelConfigSet $nLineAll 0 1 32000 200000000 1 0 2 0 1 0
	dsl TrellisEnableConfigSet $nLineAll 0 1
	dsl BitswapEnableConfigSet $nLineAll 0 1
	dsl BitswapEnableConfigSet $nLineAll 1 1
	dsl G997_NoiseMarginConfigSet $nLineAll 0 60 310 0
	dsl G997_NoiseMarginConfigSet $nLineAll 1 60 310 0
	dsl G997_PsdMaskConfigSet $nLineAll 1 1
	dsl G997_RfiBandsConfigSet $nLineAll 1
	dsl G997_UsPowerBackOffConfigSet $nLineAll 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	dsl G997_DsPowerBackOffConfigSet $nLineAll 0 0 0 0 0 0 0 32
	dsl G997_LineActivateConfigSet $nLineAll 0 0 0
	dsl G997_LineSpectrumConfigSet $nLineAll 1 1 -400 204 0 0
	dsl G997_VdslClassMaskConfigSet $nLineAll 0 0 0 0
	dsl BandPlanConfigSet $nLineAll 50 7 0
	dsl LineOptionsConfigSet $nLineAll 7 3 0 0
	dsl InterleaverMemPartitioningConfigSet $nLineAll 67
	dsl DBG_InterleaverMemPartitioningConfigSet $nLineAll 0 66 20 65535 1
	dsl G997_MinOverheadRateConfigSet $nLineAll 0 0 128000 128000
	dsl G997_MinOverheadRateConfigSet $nLineAll 0 1 128000 128000
	# RETX config TR114 REIN+Shine
	#dsl G997_RetransmissionConfigSet $nLineAll 0 1 78
	#dsl G997_ChannelRetransmissionConfigSet $nLineAll 0 0 518000 100000000 100000000 17 0 41 20 0 0 0 82 0
	#dsl G997_RetransmissionConfigSet $nLineAll 1 1 78
	#dsl G997_ChannelRetransmissionConfigSet $nLineAll 0 1 518000 200000000 200000000 17 0 41 20 0 0 0 82 0
	#dsl MiscFeatureConfigSet $nLineAll 51 7
	#dsl DBG_RetransmissionConfigSet $nLineAll 0 0

	#Disable RETX
	dsl G997_RetransmissionConfigSet -1 0 0 78
	dsl G997_RetransmissionConfigSet -1 1 0 78


	# dsl MiscFeatureConfigSet $nLineAll 36 0
	# dsl G997_VdslClassMaskConfigSet $nLineAll 0 0 0 0
	# dsl APS_ConfigSet $nLineAll 0
	# dsl G997_ChannelRateAdaptationConfigSet $nLineAll 0 0 64000 100 0
	# dsl G997_ChannelRateAdaptationConfigSet $nLineAll 0 1 64000 100 0
	# dsl AutomodeConfigSet $nLineAll 0 0
	# dsl MiscFeatureConfigSet $nLineAll 19 1
	# dsl G997_DsPowerBackOffEpsdConfigSet $nLineAll

	dsl PM_Reset $nLineAll 2
	dsl TR1CounterInhibitingSet 1
	dsl LineActivate -1
}

setup_dsl
