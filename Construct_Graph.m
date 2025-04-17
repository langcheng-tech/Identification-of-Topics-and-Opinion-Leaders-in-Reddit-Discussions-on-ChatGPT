clc;
clear;
close all

% Read the Excel file
filename = 'updated_chatgpt_reddit_comments.csv'; % Update with your actual filename
data = readtable(filename);

% Extract comment_id and comment_parent_id
comment_ids = data.comment_id;
parent_ids = data.comment_parent_id;

% Collect all unique node names
all_nodes = unique([comment_ids; parent_ids]);

% Create a list of edges (source, target)
sources = comment_ids;
targets = parent_ids;

% Create a directed graph
G = digraph(sources, targets, [], all_nodes, 'OmitSelfLoops');

% Plot the graph title('Comment Thread Graph');
figure;
% p = plot(G, 'Layout', 'force', 'NodeLabel', G.Nodes.Name);
p = plot(G, 'Layout', 'force');
axis off;

% Adjust figure size if needed
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0, 0.04, 1, 0.96]);

% Save the figure as a PNG file：saveas(gcf, 'CommentThreadGraph.png');

