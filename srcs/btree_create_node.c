#include "ft_graph.h"
#include "libft.h"

t_btree			*btree_create_node(void *content, size_t content_size)
{
	t_btree		*new_node;

	if (!(new_node = (t_btree*)ft_memalloc(sizeof(t_btree) + content_size)))
		return (NULL);
	if (content)
		ft_memcpy((void*)new_node->content, content, content_size);
	return (new_node);
}