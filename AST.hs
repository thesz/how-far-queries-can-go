-- |AST.hs
-- An abstract syntax tree definition for queries.

{-# LANGUAGE GADTs #-}

module AST where

data AST a where
	-- |Constant. We can't go anywhere without constants.
	Const :: a -> AST a
	-- |Query from a table.
	Query :: AST a
	-- |Cross product.
	Cross :: AST a -> AST b -> AST (a,b)
	-- |Filtering over the query.
	Filter :: (a -> Bool) -> AST a -> AST a
