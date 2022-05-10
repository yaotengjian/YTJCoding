package main

import (
    "fmt"
    "time"
    "github.com/shirou/gopsutil/cpu"
)

func main() {
    c, _ := cpu.Info()
    fmt.Println("cpu信息:",c)
    /*用户CPU时间/系统CPU时间/空闲时间。。。等等
    用户CPU时间：就是用户的进程获得了CPU资源以后，在用户态执行的时间。
    系统CPU时间：用户进程获得了CPU资源以后，在内核态的执行时间。
    */
    c1,_ := cpu.Times(false)
    fmt.Println("cpu1:",c1)
    
    // CPU使用率，每秒刷新一次
    for{
     c2, _ := cpu.Percent(time.Duration(time.Second), false)
     fmt.Println(c2)
    }
}
