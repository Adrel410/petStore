# Define the Animal class
Animal := Object clone do(
    name := "Unnamed Animal"
    sleep := method("2000: #{name} the Animal goes to sleep." println)
)

# Define the Feline class, which inherits from Animal
Feline := Animal clone do(
    eat := method("Feline is eating." println)
    play := method("Feline is playing." println)
    makeNoise := method("Feline is making noise." println)
)

# Define the Cat class, which inherits from Feline
Cat := Feline clone do(
    makeNoise := method("Cat is meowing." println)
)

# Define the Canine class, which inherits from Animal
Canine := Animal clone do(
    eat := method("Canine is eating." println)
    play := method("Canine is playing." println)
    makeNoise := method("Canine is making noise." println)
)

# Define the Dog class, which inherits from Canine
Dog := Canine clone do(
    makeNoise := method("Dog is barking." println)
)

# Define the Staff class
Staff := Object clone do(
    arrive := method("Staff is arriving." println)
    lunch := method("Staff is having lunch." println)
    leave := method("Staff is leaving." println)
)

# Define the Manager class, which inherits from Staff
Manager := Staff clone do(
    openStore := method(
        "0800: Manager arrives and opens the store." println
        "0800: Animals make noise." println
    )
    closeStore := method(
        "1800: Manager closes the store." println
        "1800: Animals go to sleep." println
    )
)

# Define the Clerk class, which inherits from Staff
Clerk := Staff clone do(
    feedAnimals := method("0900: Clerk feeds the animals." println)
    playAnimals := method("1100: Clerk plays with the animals." println)
    sellAnimals := method(
        "1600: Clerk sells animals." println
		d := Date clone
        x := (Date now asNumber) - (Date now asNumber floor)  # Get the current time as a seed
        #random := Random clone seed(seed)
        
        animals := list(
            Cat named("Cookie"), Cat named("Clem"), Cat named("Cleo"),
            Dog named("Buddy"), Dog named("Max"), Dog named("Rocky")
        )
        
        animals foreach(animal,
			x := (Date now asNumber) - (Date now asNumber floor)
            if(x > 0.8,
                "1600: #{animal name} is sold and replaced." println
                newAnimal := animal clone
                newAnimal name := "New #{animal name}"
                animals atPut(animals indexOf(animal), newAnimal)
            )
        )
    )
    leave := method("1700: Clerk leaves." println)
)

# Define the Clock class
Clock := Object clone do(
    day := 1
    hour := 800
    announceHour := method(
        if(hour == 800, Manager arrive; Manager openStore)
        if(hour == 900, Clerk arrive; Clerk feedAnimals)
        if(hour == 1100, Clerk playAnimals)
        if(hour == 1200, Manager lunch)
        if(hour == 1300, Staff lunch)
        if(hour == 1600, Clerk sellAnimals)
        if(hour == 1700, Clerk leave)
        if(hour == 1800, Manager closeStore)
        hour = hour + 100
        if(hour == 2400, day = day + 1; hour = 800)
    )
)

# Define a method to create a named Cat instance
Cat named := method(name,
    cat := Cat clone
    cat name := name
    cat
)

# Define a method to create a named Dog instance
Dog named := method(name,
    dog := Dog clone
    dog name := name
    dog
)

# Set up the named instances
Manager name := "Alice"
Clerk name := "Bob"

11 repeat(Clock announceHour)
y := File standardInput readLine

