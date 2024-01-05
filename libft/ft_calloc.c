/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_calloc.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: francoma <francoma@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/06 16:11:50 by francoma          #+#    #+#             */
/*   Updated: 2023/01/12 11:05:17 by francoma         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include "libft.h"

// #define MAX_SIZE_T_SQ_ROOT 4294967296
// if ((count + size) / 2 >= MAX_SIZE_T_SQ_ROOT)
// 	return (NULL);

void	*ft_calloc(size_t count, size_t size)
{
	void	*res;
	size_t	i;
	size_t	len;

	res = malloc(size * count);
	if (!res)
		return (NULL);
	len = size * count;
	i = 0;
	while (i < len)
	{
		((char *) res)[i] = 0;
		i++;
	}
	return (res);
}
