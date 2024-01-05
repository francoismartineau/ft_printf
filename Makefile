NAME = libftprintf.a

AR = ar -rc
CC = gcc
CFLAGS = -Wall -Wextra -Werror -MMD -O2

SRC_DIR = srcs/
SRC_FILES = aconsumer.c \
	display_char.c \
        display_numbers.c \
        display_str.c \
        ft_math.c \
        ft_printf.c \
        ft_str.c \
        ids.c \
        numbers_util.c \
        puts.c
SRCS = $(addprefix $(SRC_DIR),$(SRC_FILES))
OBJS = $(SRCS:.c=.o)
DEPS = $(OBJS:.o=.d)

LIBFT_DIR = libft/
LIBFT_SRC_FILES = ft_atoi.c \
        ft_bzero.c \
        ft_calloc.c \
        ft_isalnum.c \
        ft_isalpha.c \
        ft_isascii.c \
        ft_isdigit.c \
        ft_isprint.c \
        ft_itoa.c \
        ft_lstadd_back_bonus.c \
        ft_lstadd_front_bonus.c \
        ft_lstclear_bonus.c \
        ft_lstdelone_bonus.c \
        ft_lstiter_bonus.c \
        ft_lstlast_bonus.c \
        ft_lstmap_bonus.c \
        ft_lstnew_bonus.c \
        ft_lstsize_bonus.c \
        ft_memchr.c \
        ft_memcmp.c \
        ft_memcpy.c \
        ft_memmove.c \
        ft_memset.c \
        ft_putchar_fd.c \
        ft_putendl_fd.c \
        ft_putnbr_fd.c \
        ft_putstr_fd.c \
        ft_split.c \
        ft_strchr.c \
        ft_strdup.c \
        ft_striteri.c \
        ft_strjoin.c \
        ft_strlcat.c \
        ft_strlcpy.c \
        ft_strlen.c \
        ft_strmapi.c \
        ft_strncmp.c \
        ft_strnstr.c \
        ft_strrchr.c \
        ft_strtrim.c \
        ft_substr.c \
        ft_tolower.c \
        ft_toupper.c
LIBFT_SRCS = $(addprefix $(LIBFT_DIR),$(LIBFT_SRC_FILES))
LIBFT_OBJS = $(LIBFT_SRCS:%.c=%.o)
LIBFT_DEPS = $(LIBFT_OBJS:.o=.d)

LDFLAGS = -L.
LDLIBS = -lftprintf

all: $(NAME)

bonus: all

$(NAME): $(OBJS) $(LIBFT_OBJS)
	$(AR) $@ $(OBJS) $(LIBFT_OBJS)

main: main.c $(NAME)
	$(CC) $(LDLIBS) $(LDFLAGS)  -o $@ $<

$(SRC_DIR)%.o: $(SRC_DIR)%.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	@rm -f $(OBJS) $(DEPS) $(LIBFT_OBJS) $(LIBFT_DEPS)

fclean: clean
	@rm -f $(NAME)

re: fclean all

.PHONY: all bonus clean fclean re

-include $(DEPS) $(LIBFT_DEPS)