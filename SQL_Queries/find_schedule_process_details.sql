WITH MASTER_TAB AS (
   SELECT (
      CASE
         WHEN STATE = 1  THEN
            'Wait'
         WHEN STATE = 2  THEN
            'Ready'
         WHEN STATE = 3  THEN
            'Running'
         WHEN STATE = 4  THEN
            'Completed'
         WHEN STATE = 9  THEN
            'Cancelled'
         WHEN STATE = 10 THEN
            'Error'
         WHEN STATE = 11 THEN
            'Warning'
         WHEN STATE = 12 THEN
            'Succeeded'
         WHEN STATE = 13 THEN
            'Paused'
         WHEN STATE = 15 THEN
            'Validation Failed'
         WHEN STATE = 17 THEN
            'Finished'
         ELSE
            TO_CHAR(STATE)
      END
   ) REQUEST_STATE,
          RH.*
     FROM FUSION_ORA_ESS.REQUEST_HISTORY RH
)
SELECT REQUEST_STATE,
       REQUESTID,
       ABSPARENTID,
       USERNAME,
       PRODUCT,
       PRIORITY,
       NAME,
       TYPE,
       SCHEDULE,
       SCHEDULED,
       PROCESSSTART,
       PROCESSEND,
       REQUESTEDSTART,
       REQUESTEDEND,
       COMPLETEDTIME,
       READYTIME,
       PARTITION_TIME,
       SUBMISSION,
       PARENTREQUESTID,
       SUBMITTER,
       PREPROCESS_STATUS,
       POSTPROCESS_STATUS,
       EXECUTABLE_STATUS
 -- APPLICATION,
    -- JOBTYPE,
    -- DEFINITION,
    -- WORKASSIGNMENT,
    -- PROCESSOR,
    -- CLASSNAME,
    -- EXECUTINGINSTANCE
  FROM MASTER_TAB
 WHERE REQUEST_STATE IN ( :STATE )
 ORDER BY REQUESTID DESC

 /* SQL Query for List of Values */
 /*
 SELECT DISTINCT (
        CASE
            WHEN STATE = 1 THEN
                'Wait'
            WHEN STATE = 2 THEN
                'Ready'
            WHEN STATE = 3 THEN
                'Running'
            WHEN STATE = 4 THEN
                'Completed'
            WHEN STATE = 9 THEN
                'Cancelled'
            WHEN STATE = 10 THEN
                'Error'
            WHEN STATE = 11 THEN
                'Warning'
            WHEN STATE = 12 THEN
                'Succeeded'
            WHEN STATE = 13 THEN
                'Paused'
            WHEN STATE = 15 THEN
                'Validation Failed'
            WHEN STATE = 17 THEN
                'Finished'
            ELSE
                TO_CHAR (STATE)
        END )          REQUEST_STATE
FROM FUSION_ORA_ESS.REQUEST_HISTORY
*/