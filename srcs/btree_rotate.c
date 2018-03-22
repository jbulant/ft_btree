#include "ft_graph.h"

static t_bool	node_has_child(t_btree *node)
{
	return (node && !(node->left || node->right) ? FALSE : TRUE);
}

// void			btree_rotate_left(t_btree *node)
// {
	
// }

// void			btree_rotate_right(t_btree *node)
// {

// }