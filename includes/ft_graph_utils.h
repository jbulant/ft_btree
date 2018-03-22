#ifndef FT_GRAPH_UTILS_H
# define FT_GRAPH_UTILS_H

# include "ft_graph.h"

t_btree		*node_grandparent(t_btree *node);
t_btree		*node_uncle(t_btree *node);
void		btree_rotate_left(t_btree *node);
void		btree_rotate_right(t_btree *node);

#endif
