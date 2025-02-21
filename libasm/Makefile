NAME = libasm

LIB = libasm.a

SRCS = ft__strlen.s ft__strcpy.s ft__strcmp.s ft__write.s ft__read.s ft__strdup.s

CC = gcc

CFLAGS = -Wall -Wextra -Werror

NASM = nasm 

NASM_FLAGS = -f elf64

OBJ = $(SRCS:.s=.o)


%.o : %.s 
	$(NASM) $(NASM_FLAGS) $< -o $@

all : $(NAME)

$(NAME) : $(OBJ)
	ar rcs $(LIB) $(OBJ)

test :
	$(CC) $(CFLAGS) -no-pie main.c $(LIB) -o $(NAME)

clean :
	rm -f $(OBJ)

fclean : clean
	rm -f $(LIB) $(NAME)

re : fclean all

