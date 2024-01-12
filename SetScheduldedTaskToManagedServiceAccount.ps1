#Create your planned task like normal
#For the login of the task use a normal user
#Now run the following command to set you managed service account user for the planned task
#After a refresh the managedserviceaccount should be listet as the user used to run the task

schtasks /Change /TN ScheduledTaskName /RU "ManagedServiceAccount$" /RP ""
