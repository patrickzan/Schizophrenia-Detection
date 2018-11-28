% In this step, I extract features for all frames. I used the timing of M50
% M100 and M200, the significance levels of M50 and M100. 

clear all

% extract features of younger subjects in training set.
root = '/Users/pzan/Documents/study_research/cssl/projects/meg_pattern';
train_younger_folder = fullfile(root, 'data', 'train', 'younger');
train_younger_list = dir([train_younger_folder, '/*.mat']);
% create a matrix to save the features. If you use more features, please
% modify the parameter '6' to your feature number.
train_younger_feature = zeros(length(train_younger_list), 6);
for i = 1:length(train_younger_list)
    % load data
    data = load(fullfile(train_younger_folder, train_younger_list(i).name));
    I = data.I;
    % extract timings of M50, M100 and M200
    train_younger_feature(i, 1) = timing(I, 50, [40, 60]);
    train_younger_feature(i, 2) = timing(I, 100, [90, 110]);
    train_younger_feature(i, 3) = timing(I, 200, [185, 215]);
    % extract significance levels of M50, M100 and M200
    train_younger_feature(i, 4) = significance(I, 50, [40, 60]);
    train_younger_feature(i, 5) = significance(I, 100, [90, 110]);
    train_younger_feature(i, 6) = significance(I, 200, [185, 215]);
end

% extract features of older subjects in training set.
train_older_folder = fullfile(root, 'data', 'train', 'older');
train_older_list = dir([train_older_folder, '/*.mat']);
% create a matrix to save the features. If you use more features, please
% modify the parameter '6' to your feature number.
train_older_feature = zeros(length(train_older_list), 6);
for i = 1:length(train_older_list)
    % load data
    data = load(fullfile(train_older_folder, train_older_list(i).name));
    I = data.I;
    % extract timings of M50, M100 and M200
    train_older_feature(i, 1) = timing(I, 50, [40, 60]);
    train_older_feature(i, 2) = timing(I, 100, [90, 110]);
    train_older_feature(i, 3) = timing(I, 200, [185, 215]);
    % extract significance levels of M50, M100 and M200
    train_older_feature(i, 4) = significance(I, 50, [40, 60]);
    train_older_feature(i, 5) = significance(I, 100, [90, 110]);
    train_older_feature(i, 6) = significance(I, 200, [185, 215]);
end

% extract features of younger subjects in testing set.
test_younger_folder = fullfile(root, 'data', 'test', 'younger');
test_younger_list = dir([test_younger_folder, '/*.mat']);
% create a matrix to save the features. If you use more features, please
% modify the parameter '6' to your feature number.
test_younger_feature = zeros(length(test_younger_list), 6);
for i = 1:length(test_younger_list)
    % load data
    data = load(fullfile(test_younger_folder, test_younger_list(i).name));
    I = data.I;
    % extract timings of M50, M100 and M200
    test_younger_feature(i, 1) = timing(I, 50, [40, 60]);
    test_younger_feature(i, 2) = timing(I, 100, [90, 110]);
    test_younger_feature(i, 3) = timing(I, 200, [185, 215]);
    % extract significance levels of M50, M100 and M200
    test_younger_feature(i, 4) = significance(I, 50, [40, 60]);
    test_younger_feature(i, 5) = significance(I, 100, [90, 110]);
    test_younger_feature(i, 6) = significance(I, 200, [185, 215]);
end

% extract features of older subjects in testing set.
test_older_folder = fullfile(root, 'data', 'test', 'older');
test_older_list = dir([test_older_folder, '/*.mat']);
% create a matrix to save the features. If you use more features, please
% modify the parameter '6' to your feature number.
test_older_feature = zeros(length(test_older_list), 6);
for i = 1:length(test_older_list)
    % load data
    data = load(fullfile(test_older_folder, test_older_list(i).name));
    I = data.I;
    % extract timings of M50, M100 and M200
    test_older_feature(i, 1) = timing(I, 50, [40, 60]);
    test_older_feature(i, 2) = timing(I, 100, [90, 110]);
    test_older_feature(i, 3) = timing(I, 200, [185, 215]);
    % extract significance levels of M50, M100 and M200
    test_older_feature(i, 4) = significance(I, 50, [40, 60]);
    test_older_feature(i, 5) = significance(I, 100, [90, 110]);
    test_older_feature(i, 6) = significance(I, 200, [185, 215]);
end

save(fullfile(root, 'feature', 'feature.mat'), 'train_younger_feature', ...
    'train_older_feature', 'test_younger_feature', 'test_older_feature');






