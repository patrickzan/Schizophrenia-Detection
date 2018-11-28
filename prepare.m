% feature 6: M200 significance feature
significance200_train_feature = trainset(:, 1);
significance200_test_feature = testset(:, 1);
% calculate the distance between two trials by using timing50 feature 
significance200_train_feature_mat = repmat(significance200_train_feature, 1,pos_test_num + neg_test_num);
significance200_test_feature_mat = repmat(clarity_test_feature', pos_train_num + neg_train_num,1);
significance200_distance = significance200_train_feature_mat - significance200_test_feature_mat;
significance200_distance = significance200_distance.^2;
%after calculating the distance, use k-nearest-neighbor(knn) classifier
%to classify trials
[significance200_disMat,significance200_Index] = sort(significance200_distance);
significance200_test_pos = sum(significance200_Index(1:k,:)<pos_train_num + 1);
significance200_test_neg = sum(significance200_Index(1:k,:)>pos_train_num);
significance200_test_pos = significance200_test_pos./k;
significance200_test_neg = significance200_test_neg./k;
% I use 0.5 as the threshold
significance200_precision = (sum(significance200_test_pos(1:pos_test_num)>0.5) + sum(significance200_test_pos(pos_test_num + 1:test_num)<0.5))/test_num;
