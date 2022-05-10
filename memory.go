package main

import (
	"fmt"
	"strconv"

	"github.com/shirou/gopsutil/v3/mem"
	// "github.com/shirou/gopsutil/mem"  // to use v2
)

func main() {
	v, _ := mem.VirtualMemory()

	max := 20
	fmt.Printf("%-"+strconv.Itoa(max)+"s %.0fG\n", "Total:", float64(v.Total/1024/1024/1024))
	fmt.Printf("%-"+strconv.Itoa(max)+"s %.0fG\n", "Used:", float64(v.Used/1024/1024/1024))
	fmt.Printf("%-"+strconv.Itoa(max)+"s %.1fG\n", "Free:", float64(v.Free)/1024/1024/1024)
	fmt.Printf("%-"+strconv.Itoa(max)+"s %.2f%%\n", "UsedPercent:", v.UsedPercent)
	fmt.Printf("%-"+strconv.Itoa(max)+"s %vG\n", "Active:", v.Active/1024/1024/1024)
	fmt.Printf("%-"+strconv.Itoa(max)+"s %vG\n", "Inactive:", v.Inactive/1024/1024/1024)
	fmt.Printf("%-"+strconv.Itoa(max)+"s %vG\n", "Wired:", v.Wired/1024/1024/1024)

	// convert to JSON. String() is also implemented
	//fmt.Println(v)
}
