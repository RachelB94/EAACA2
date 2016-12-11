# Script to calculate different functions relating to results.dat

	setwd("G:\\4th Year\\EAA\\CA2")
	perfdata <- read.table("results.dat", header=TRUE)

# calculating Utilization: Ui Vs N (No of Users)
# calculating the busy time by subtracting the idle time by the total possible busy time which is 100
	busy <- 100-perfdata$idle
	# Ui = Bi / T 
	# To calculate the utilization, divide total busy time by 100
	# Ensuring the margin is between 0 - 1
	ui <- busy/100


# plotting utilization graph
plot(ui, type="b" , xlab="Concurrent Users", ylab="Idle Time", main="Utilization vs Number of Users")

# calculating the throughput XO: XO vs N 
	
	# the amount of materials or items passed through a system or process
	# Xo = Completed operations / Time; taking 9s from mpstat function in runtest.ssh
	# output in transactions per second
	throughput <- perfdata$CO/9

# plotting throughput graph
plot(throughput, type="b", xlab="Number of Users", ylab="Throughput", main="Throughput vs Number of Users")
# calculating Service Demand DI: DI vs N

	 # DI = UI / XO
	 servicedemand <- ui / throughput

# plotting the service demand graph
plot(servicedemand, type="b" , xlab="Utilization", ylab="Throughput", main="Service Demand vs Number of Users")
# calculating the responsetime: R = N/XO - Z
# Number of Users and Z = Think Time
# 5s is the Think Time from Timeout function in runtest.ssh

	rtime <- 50/throughput - 5
	
# plotting the responsetime graph
plot(rtime, type="b", xlab="Number of Users", ylab="Throughput", main="Response Time Vs Number of Users")
