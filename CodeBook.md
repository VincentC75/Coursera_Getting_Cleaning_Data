# Peer Graded Project from Coursera - Getting and Cleaning Data

This CodeBook describes the variables, the data and all transformations that are performed to clean up the data.

## Data transformations

The following steps are followed to transmom the data

1. Load and join this data which is split in a testing and training set
1. Load labels for the features from description files and assign appropriate column names, filtering symbols.
1. Among all measurements, only those related to mean and standard deviation are retained.
1. Replace activity identifiers by activity names.
1. Create a final tidy data set by taking the mean of all variables, grouped by activity and subject.

## Identifiers

* `activity` - The type of activity performed when the corresponding measurements were taken
* `subjectid` - The ID of the test subject
* others - Measurements from the accelerometer and gyroscope
  * t prefix indicates time domain signals
  * f prefix indicates that a Fast Fourier Transform (FFT) was applied to the variable
  * mean: Mean value
  * std: Standard deviation
  * meanFreq: Weighted average of the frequency components to obtain a mean frequency

## Activity Labels

* `WALKING`: subject was walking during the test
* `WALKING_UPSTAIRS`: subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS`: subject was walking down a staircase during the test
* `SITTING`: subject was sitting during the test
* `STANDING`: subject was standing during the test
* `LAYING`: subject was laying down during the test

