%  In this step, I filter raw MEG data and extract events, make 100 images
%  for each subject. Then label all subjects into either older or younger
%  datasets.
clear all
root = '/Users/pzan/Documents/study_research/cssl/projects/meg_pattern';

% Preprocess raw MEG data for younger subjects and devide them into
% training set and testing set.
raw_younger_folder = fullfile(root, 'data', 'raw', 'younger');
raw_younger_list = dir(fullfile(raw_younger_folder, '*.sqd'));

train_younger_folder = fullfile(root, 'data', 'train', 'younger');
test_younger_folder = fullfile(root, 'data', 'test', 'younger');
tri = 163;
fs = 1000;
bad_ch = 56;
for i = 1:length(raw_younger_list)
    raw = sqdread(fullfile(raw_younger_folder, raw_younger_list(i).name));
    data = raw(:, 1:157)';
    data = data - repmat(mean(data, 2), 1, size(data, 2));
    % filter raw data (2, 40)Hz and align them
    data_filt = zeros(size(data));
    for k = 1:size(data, 1)
        data_filt(k,:) = lowp(data(k, :), 40, 50, fs);
    end
    trigger_times = find(diff(raw(:,tri))<-1e5);
    fprintf('There are %d epochs for %s. \n', length(trigger_times), raw_younger_list(i).name);
    no_epochs = length(trigger_times);
    for j = 1:no_epochs
        I = data_filt(:, trigger_times(j):trigger_times(j)+fs-1); 
        if i <= length(raw_younger_list)/2
            save(fullfile(train_younger_folder, [raw_younger_list(i).name(1:end-4), '-', num2str(j), '.mat']), 'I')
        else 
            save(fullfile(test_younger_folder, [raw_younger_list(i).name(1:end-4), '-', num2str(j), '.mat']), 'I')
        end
    end
end


% Preprocess raw MEG data for older subjects and devide them into
% training set and testing set.
raw_older_folder = fullfile(root, 'data', 'raw', 'older');
raw_older_list = dir(fullfile(raw_older_folder, '*.sqd'));

train_older_folder = fullfile(root, 'data', 'train', 'older');
test_older_folder = fullfile(root, 'data', 'test', 'older');

for i = 1:length(raw_older_list)
    raw = sqdread(fullfile(raw_older_folder, raw_older_list(i).name));
    data = raw(:, 1:157)';
    data = data - repmat(mean(data, 2), 1, size(data, 2));
    data_filt = zeros(size(data));
    % filter raw data (2,40)Hz and align them
    for k = 1:size(data, 1)
        data_filt(k, :) = lowp(data(k,:), 40, 50, fs);
    end
    trigger_times = find(diff(raw(:,tri))<-1e5);
    fprintf('There are %d epochs for %s. \n', length(trigger_times), raw_older_list(i).name);
    no_epochs = length(trigger_times);
    for j = 1:no_epochs
        I = data_filt(:, trigger_times(j):trigger_times(j)+fs-1); 
        if i <= length(raw_older_list)/2
            save(fullfile(train_older_folder, [raw_older_list(i).name(1:end-4), '-', num2str(j), '.mat']), 'I')
        else 
            save(fullfile(test_older_folder, [raw_older_list(i).name(1:end-4), '-', num2str(j), '.mat']), 'I')
        end
    end
end





