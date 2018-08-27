t_high = 7
t_low = 4
alarm = "none"
hysteresis = 1
assert((t_high - hysteresis) > (t_low + hysteresis))
for r in range(2):
    for x in [ 0, 1, 2, 3, 4, 3, 4, 3, 4, 5, 6, 7, 6, 7, 6, 8, 9, 8, 7, 6, 5, 4, 3, 2, 1 ]:
      if alarm == "high":
         if x < (t_high - hysteresis):
           alarm = ""

      elif alarm == "low":
         if x > (t_low + hysteresis):
           alarm = ""

      else:
        if x >= t_high:
           alarm = "high"
        elif x <= t_low:
           alarm = "low"


      print "Sample:%u => alarm=%s"%(x, alarm)
   
