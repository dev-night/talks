package main

import (
	"fmt"
	"sync"
	"time"
)

var waitGroup sync.WaitGroup

const coffeeCount = 10

func main() {
	var coffeeFinished [coffeeCount]chan bool
	for i := 0; i < coffeeCount; i++ {
		coffeeFinished[i] = make(chan bool)
	}
	go runAbortScreen(coffeeFinished)

	for i := 0; i < coffeeCount; i++ {
		waitGroup.Add(1)
		go func(i int) {
			go makeCoffee(i+1, coffeeFinished[i])
			<-coffeeFinished[i]
			waitGroup.Done()
		}(i)

		time.Sleep(time.Second)
	}

	waitGroup.Wait()
}

func runAbortScreen(isAbort [coffeeCount]chan bool) {
	fmt.Println("Press a number to cancel making coffee!")

	for {
		var key int
		fmt.Scanf("%d", &key)
		fmt.Println("Cancelling coffee #", key)

		close(isAbort[key-1])
	}
}

func makeCoffee(number int, isFinished chan bool) {
	select {
	case <-isFinished:
		return
	default:
		fmt.Println("Making coffee #", number)
		grindBeans(number)
	}

	select {
	case <-isFinished:
		return
	default:
		prepareCoffee(number)
	}

	select {
	case <-isFinished:
		return
	default:
		steamMilk(number)
	}

	fmt.Println("Coffee #", number, " is ready!")
	isFinished <- true
}

func grindBeans(number int) {
	fmt.Println("Grinding beans #", number, " ...")
	time.Sleep(3 * time.Second)
}

func prepareCoffee(number int) {
	fmt.Println("Preparing coffee #", number, " ...")
	time.Sleep(1 * time.Second)
}

func steamMilk(number int) {
	fmt.Println("Steaming milk #", number, " ...")
	time.Sleep(2 * time.Second)
}
