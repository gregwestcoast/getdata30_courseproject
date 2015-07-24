# getdata30_courseproject
Coursera getdata-030 course project - creating a tidy data set
This script reads four raw data files which once combined contain the following data:
    1) the particpant (subject) identification number
    2) the activity number (one of six activities) and the corresponding description
    3) data arising from various measurements made by a Samsung phone which when interpreted describe the activity
      in the context of positional axis and body position.
      
  The program takes the combined data set and processes it as follows:
    1) specific data measurements of mean and standard deviation are extracted from the general data set
    2) those measurements are then ordered by subject and activity
    3) the desired tidy data set is then completed with the inclusion of meaningful labels associated with the variables.
    
  Finally, the script uses this data set and creates a second data set which summarizes each of the measured variables by
  activity within a suject and the overall mean of the measured variable.  This final data set is part of the course project submission.
  
  The file submission is a .txt file which can be viewed in excel using " as a delimiter.
