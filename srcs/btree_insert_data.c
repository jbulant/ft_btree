#include "ft_graph.h"

t_bool			node_has_child(t_btree *node)
{
	if (!node || (!node->left && !node->right))
		return (FALSE);
	return (TRUE);
}

t_btree			*find_parent(t_btree *root, void *data
							, int (*cmp)(void *, void *))
{
	int		result;

	result = cmp((void*)root->content, data);
	if ()
}

t_btree			*btree_insert_data(t_btree **root, void *data, size_t data_size
								, int (*cmp)(void *, void *))
{
	t_btree		*new_node;
	t_btree		*parent;

	if (!root || !cmp || !(new_node = btree_create_node(data, data_size)))
		return (NULL);
	if (!*root)
		*root = new_node;
	parent = find_parent(*root, data, cmp);
}