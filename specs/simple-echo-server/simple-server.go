package main

 import (
  "fmt"
  "net/http"
  "net"
  "os"
 )

 func IndexPage(w http.ResponseWriter, r *http.Request) {

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

    // get client ClientIP address
    ClientIP,_,_ := net.SplitHostPort(r.RemoteAddr)


  // print out the details
  fmt.Fprintf(w,"PodName: %s - PodIP: %s - ClientIP: %s \n\n",PodName,PodIP,ClientIP)

  // sometimes, the user acccess the web server via a proxy or load balancer.
  // The above IP address will be the IP address of the proxy or load balancer and not the user's machine.


  // let's get the request HTTP header "X-Forwarded-For (XFF)"
  // if the value returned is not null, then this is the real IP address of the user.
//----  fmt.Fprintf(w,"X-Forwarded-For :" + r.Header.Get("X-FORWARDED-FOR"));
 }


 func main() {
  http.HandleFunc("/", IndexPage)
  http.ListenAndServe(":9876", nil)
 }
