TARGET = bin\dbview.exe
SRC = $(wildcard src/*.c) # a list of all c files in the src folder
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC)) # replaces all instances of src/%.c found in SRC with obj/%.o

run: clean default
	.\$(TARGET) -f mynewdb.db -n -a "Timmy H.,123 Shesire Ln.,120"
	
	 
	

default: $(TARGET)

clean:
	del obj\*.o
	del bin\*.exe
	del *.db

$(TARGET): $(OBJ)
	gcc -o $@ $? -lws2_32

obj/%.o : src/%.c
	gcc -c $< -o $@ -Iinclude


