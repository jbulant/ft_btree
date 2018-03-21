#ifndef FT_GRAPH_H
# define FT_GRAPH_H

#include <stdlib.h>

typedef struct	s_btree		t_btree;

typedef enum	e_bt_color
{
	BT_BLACK = 0,
	BT_RED = 1
}				t_bt_color;

typedef struct	s_btree
{
	t_btree		*parent;
	t_btree		*left;
	t_btree		*right;
	t_bt_color	color : 1;
	char		content[0];
}				t_btree;

t_btree			*btree_create_node(void *content, size_t content_size);
void			btree_insert_data(t_btree **root, void *to_add
								, int (*cmp)(void *, void *));
void			*btree_search_item(t_btree *root, void *data_ref
								, int (*cmp)(void *, void *));
void			*btree_remove(t_btree *root, void *data_ref
							, int (*cmp)(void *, void *)
							, void (*free)(void *));

#endif