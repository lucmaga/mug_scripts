# Calculate information for tst-cpuclock1

calculate_values <- function(data, target) {
	std = sd(data)
	average = mean(data)

	i = 0
	repeat{
		v = average - std*i
		if (length(data[ data < v ]) / length(data) < 0.015) {
			break;
		}
		i = i + 1
	}
	print("average - std*i, lower bound is ")
	print(v)
	print("Which is average = std*")
	print(i)
	print("And is in %")
	print(length(data[ data < v ]) / length(data))
	print("It's X of target percent")
	print(abs(target - v) / (0.5*(target+v)))

	i = 0
	repeat{
		v = average + std*i
		if (length(data[ data > v ]) / length(data) < 0.015) {
			break;
		}
		i = i + 1
	}
	print("average - std*i, upper bound is ")
	print(v)
	print("Which is average = std*")
	print(i)
	print("And is in %")
	print(length(data[ data > v ]) / length(data))
	print("It's X of target percent")
	print(abs(target - v) / (0.5*(target+v)))
}

calculate_90 <- function(data, target) {
	m = mean(data);
	print("mean for data is")
	print(m)

	#Look for values < than target
	lesser = data[data < target]
	print("The average lesser is")
	print(mean(lesser))

	lesser = sort(lesser,decreasing=T)
	print("The value for the lower 90% is")
	n = lesser[ceiling(length(lesser)*.9)]
	print(n)
	print("[90n]/target is ")
	print(n/target)

	#look for values > than target
	bigger = data[data > target]
	print("The average bigger is")
	print(mean(bigger))

	bigger = sort(bigger,decreasing=F)
	print("The value for the upper 90% is")
	n = bigger[ceiling(length(bigger)*.9)]
	print(n)
	print("[90n]/target is ")
	print(n/target)
}

data = read.csv("clock.data", header=T)

print("Calculating for before");
calculate_90(data$before, 0.5);
print("Calculating for nano");
calculate_90(data$nano, 0.1);
print("Calculating for dead");
calculate_90(data$dead, 0.1);
