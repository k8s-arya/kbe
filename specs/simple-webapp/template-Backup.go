package main

import (
  "html/template"
  "fmt"
  "log"
  "net/http"
  "net"
  "os"
  "time"
)

type PageVariables struct {
	Date         string
	Time         string
        PodName      string
        PodIP        string
}

func main() {
	http.HandleFunc("/", HomePage)
	log.Fatal(http.ListenAndServe(":8080", nil))
}

func HomePage(w http.ResponseWriter, r *http.Request){

    now := time.Now() // find the time right now

    PodName, err := os.Hostname()
        if err != nil {
           panic(err)
    }

   var PodIP = "hello"
   addrs, _ := net.LookupIP(PodName)
        for _, addr := range addrs {
            if ipv4 := addr.To4(); ipv4 != nil {
               PodIP = fmt.Sprintf("%s", ipv4)
            }
    }


    HomePageVars := PageVariables{ //store the date and time in a struct
      Date: now.Format("02-01-2006"),
      Time: now.Format("15:04:05"),
      PodName: PodName,
      PodIP: PodIP,
    }

    t, err := template.ParseFiles("homepage.html") //parse the html file homepage.html
    if err != nil { // if there is an error
  	  log.Print("template parsing error: ", err) // log it
  	}
    err = t.Execute(w, HomePageVars) //execute the template and pass it the HomePageVars struct to fill in the gaps
    if err != nil { // if there is an error
  	  log.Print("template executing error: ", err) //log it
  	}
}
