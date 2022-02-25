$times = "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23"
$logonevents = Get-Eventlog -LogName Security -InstanceID 4624

foreach ($event in $logonevents){
    
    if ($event.ReplacementStrings[5] -notlike '*$'){
    
        foreach ($time in $times){

            if($event.TimeGenerated -ilike '*' +$time+':*:*'){

                if (($event.ReplacementStrings[8] -eq 3) -or ($event.ReplacementStrings[8] -eq 10)){

                    write-host "`tDate: "$event.TimeGenerated "`tUser: "$event.ReplacementStrings[5] "`tIP Address: "$event.ReplacementStrings[18]

                }   
            }     
        }
    }
}
