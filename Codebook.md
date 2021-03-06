Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each observation:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean: Mean value
* std: Standard deviation

Additional Data Transformation
==============================
Given the sampling frequency and windows, each experiment generated numerous observations of mean and standard deviation variables for each signal above.  To simplify, data for each variable listed above was then aggregated by calculating the MEAN across all observations for each "experiment."  An "experiment" consists of all combinations of "subjects" (individuals participating in the experiment) and the  "activity" performed (i.e. WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING).
 
Tidy Data Structure
===================
The data is structured in a "wide and short" format, as oppose to a "tall and narrow" format.  This data structure is nevertheless "tidy" as it complies with the key criteria:  

*  Each variable measured should be in a seperate column.  
The data set is made up of three entities:  subjects, activities and measurements.  Measurements are in columns and (one could argue) are independent of each other, and therefore "tidy".  For example, as noted by David Hood (Community TA), "it is possible for an action to change a y direction reading in the phone without changing a x or z direction reading."  (See:   https://class.coursera.org/getdata-009/forum/thread?thread_id=192).  Moreover, Wickham's paper on Tidy Data indicates that the determination of whether a data set is "tidy" could also depend on the problem or question that we are trying to solve or answer.  This dataset allows for easy analysis of signals across different directions and sub-devices like the accelerometer vs. the gyroscope, hence conforms with "tidy" requirements. 

*  Each different observation of that data should be in a separate row.  
Each row in the data set represents an observation for every combination of "subject" in the experiment and the "activity" performed. 

*  There should be one table for each "kind" of variable

This data set spans only one kind of variable, which are readings from the Samsung device.

Variable List
======================
The complete list of 68 variables of each feature vector are listed below.  The list below includes "subject" which identifies the individual carrying out the experiment, and the "activity" being performed in the experiment.  Also, the variable names are "descriptive" in that they adequately communicate all the relevant attributes of the signal being measured (i.e. Time vs. Frequency domain, Body vs. Gravity, Accelerometer vs. Gyroscope, XYZ direction, Mean vs Standard Deviation as well as Jerk and Magnitude).    

1. "activity"
2. "subject"
3. "tBodyAcc.mean...X"
4. "tBodyAcc.mean...Y"
5. "tBodyAcc.mean...Z"
6. "tGravityAcc.mean...X"
7. "tGravityAcc.mean...Y"
8. "tGravityAcc.mean...Z"
9. "tBodyAccJerk.mean...X"
10. "tBodyAccJerk.mean...Y"
11. "tBodyAccJerk.mean...Z"
12. "tBodyGyro.mean...X"
13. "tBodyGyro.mean...Y"
14. "tBodyGyro.mean...Z"
15. "tBodyGyroJerk.mean...X"
16. "tBodyGyroJerk.mean...Y"
17. "tBodyGyroJerk.mean...Z"
18. "tBodyAccMag.mean.."
19. "tGravityAccMag.mean.."
20. "tBodyAccJerkMag.mean.."
21. "tBodyGyroMag.mean.."
22. "tBodyGyroJerkMag.mean.."
23. "fBodyAcc.mean...X"
24. "fBodyAcc.mean...Y"
25. "fBodyAcc.mean...Z"
26. "fBodyAccJerk.mean...X"
27. "fBodyAccJerk.mean...Y"
28. "fBodyAccJerk.mean...Z"
29. "fBodyGyro.mean...X"
30. "fBodyGyro.mean...Y"
31. "fBodyGyro.mean...Z"
32. "fBodyAccMag.mean.."
33. "fBodyBodyAccJerkMag.mean.."
34. "fBodyBodyGyroMag.mean.."
35. "fBodyBodyGyroJerkMag.mean.."
36. "tBodyAcc.std...X"
37. "tBodyAcc.std...Y"
38. "tBodyAcc.std...Z"
39. "tGravityAcc.std...X"
40. "tGravityAcc.std...Y"
41. "tGravityAcc.std...Z"
42. "tBodyAccJerk.std...X"
43. "tBodyAccJerk.std...Y"
44. "tBodyAccJerk.std...Z"
45. "tBodyGyro.std...X"
46. "tBodyGyro.std...Y"
47. "tBodyGyro.std...Z"
48. "tBodyGyroJerk.std...X"
49. "tBodyGyroJerk.std...Y"
50. "tBodyGyroJerk.std...Z"
51. "tBodyAccMag.std.."
52. "tGravityAccMag.std.."
53. "tBodyAccJerkMag.std.."
54. "tBodyGyroMag.std.."
55. "tBodyGyroJerkMag.std.."
56. "fBodyAcc.std...X"
57. "fBodyAcc.std...Y"
58. "fBodyAcc.std...Z"
59. "fBodyAccJerk.std...X"
60. "fBodyAccJerk.std...Y"
61. "fBodyAccJerk.std...Z"
62. "fBodyGyro.std...X"
63. "fBodyGyro.std...Y"
64. "fBodyGyro.std...Z"
65. "fBodyAccMag.std.."
66. "fBodyBodyAccJerkMag.std.."
67. "fBodyBodyGyroMag.std.."
68. "fBodyBodyGyroJerkMag.std.." 

