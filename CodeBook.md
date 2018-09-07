# Peer Graded Project from Coursera - Getting and Cleaning Data

This CodeBook describes the variables, the data and all transformations that are performed to clean up the data.

It uses data collected from wearable devices avalable from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data is split in a testing and training set, and each set is split in three files, so the first step is to load and join this data.

labels for the features are then loaded from description files and appropriate column names are assigned.

Among all measurements, only those related to mean and standard deviation are retained.

Activity identifiers are then replaced by activity names.

At this step, we have a tidy data set available.

A final data set is created from this first one by taking the mean of all variables, grouped by activity and subject.
