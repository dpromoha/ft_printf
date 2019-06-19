.PHONY: all clean fclean re

NAME 	= libftprintf.a

FLAGS 	= -Wall -Wextra -Werror -I./includes

LIBFT 	= libft

SRCS = ft_printf.c find_all_expansion.c fwp.c fwp_help.c \
additional_func.c percent_output.c float_output.c number_system.c \
printf_help.c int_output.c to8_output.c unsigned_output.c \
to16_output.c pointer_output.c unicode.c helping_func.c \
unicode_output.c string_output.c float_help.c float_help2.c \

SRCDIR = ./srcs/

OBJDIR = ./objects/

OBJ = $(addprefix $(OBJDIR), $(SRCS:.c=.o))

all: $(NAME)

$(NAME): $(OBJDIR) $(OBJ)
	make -C $(LIBFT)
	cp libft/libft.a $(NAME)
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)
	@echo "made libftprintf"

$(OBJDIR):
	mkdir $(OBJDIR)

$(OBJ): $(OBJDIR)%.o : $(SRCDIR)%.c
	gcc -o $@ -c $< $(FLAGS)

clean:
	make -C $(LIBFT) clean
	rm -rf $(OBJ) $(OBJDIR)

fclean: clean
	make -C $(LIBFT) fclean
	rm -rf $(NAME)

re: fclean $(NAME)

norm:
	norminette -R CheckForbiddenSourceHeader