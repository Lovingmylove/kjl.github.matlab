%%
%Solve shortest path problem in graph
%Finding the Shortest Path in a Directed Graph
%Finding the Shortest Path in an Undirected Graph
% close all;
clear;
clc;

%%
%Finding the Shortest Path in a Directed Graph
%Create and view a directed graph with 6 nodes and 11 edges.
W = [.41 .99 .51 .32 .15 .45 .38 .32 .36 .29 .21];
DG = sparse([6 1 2 2 3 4 4 5 5 6 1],[2 6 3 5 4 1 6 3 4 3 5],W);
%Biograph object with 6 nodes and 11 edges.
h = view(biograph(DG,[],'ShowWeights','on'));
%Find the shortest path in the graph from node 1 to node 6.
[dist,path,pred] = graphshortestpath(DG,1,6);
%Mark the nodes and edges of the shortest path by coloring them red and increasing the line width.
set(h.Nodes(path),'Color',[1 0.4 0.4])
edges = getedgesbynodeid(h,get(h.Nodes(path),'ID'));
set(edges,'LineColor',[1 0 0])
set(edges,'LineWidth',1.5)

%%
%Finding the Shortest Path in an Undirected Graph
%Create and view an undirected graph with 6 nodes and 11 edges.
%UG = tril(DG + DG');
%Biograph object with 6 nodes and 11 edges.
%h = view(biograph(UG,[],'ShowArrows','off','ShowWeights','on'));
%Find the shortest path in the graph from node 1 to node 6.
%[dist,path,pred] = graphshortestpath(UG,1,6,'directed',false)
%Mark the nodes and edges of the shortest path by coloring them red and increasing the line width.
%set(h.Nodes(path),'Color',[1 0.4 0.4])
%fowEdges = getedgesbynodeid(h,get(h.Nodes(path),'ID'));
%revEdges = getedgesbynodeid(h,get(h.Nodes(fliplr(path)),'ID'));
%edges = [fowEdges;revEdges];
%set(edges,'LineColor',[1 0 0])
%set(edges,'LineWidth',1.5)