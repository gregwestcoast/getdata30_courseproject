# getdata30_courseproject
Coursera getdata-030 course project - creating a tidy data set
This script reads four raw data files which once combined contain the following data:
    - the particpant (subject) identification number
    - the activity number (one of six activities) and the corresponding description
    - data arising from various measurements made by a Samsung phone which when interpreted describe the activity
      in the context of positional axis and body position
  The program takes the combined data set and processes it as follows:
    - specific data measurements of mean and standard deviation are extracted from the general data set
    - those measurements are then ordered by subject and activity
    - the desired tidy data set is then completed with the inclusion of meaningful labels associated with the variables
  Finally, the script uses this data set and creates a second data set which summarizes each of the measured variables by
  activity within a suject and the overall mean of the measured variable.  This final data set is part of the course project submission.
