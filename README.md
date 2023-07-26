# SWP391-2
Update DB for Course Online _ Create new table

CREATE TABLE tbl_onlinecourse_detail (
	course_id varchar(10),
	module_name_1 varchar(max),
	module_name_2 varchar(max),
	module_name_3 varchar(max),
	module_name_4 varchar(max),
	module_name_5 varchar(max),
	module_description_1 varchar(max),
	module_description_2 varchar(max),
	module_description_3 varchar(max),
	module_description_4 varchar(max),
	module_description_5 varchar(max)
	FOREIGN KEY (course_id) REFERENCES tbl_course(course_id)
)

Input data for above table

INSERT INTO tbl_onlinecourse_detail (
    course_id,
    module_name_1,
    module_name_2,
    module_name_3,
    module_name_4,
    module_name_5,
    module_description_1,
    module_description_2,
    module_description_3,
    module_description_4,
    module_description_5
)
VALUES (
    '14',
    'Introduction to Target Training',
    'Targeting Techniques',
    'Advanced Target Training',
    'Troubleshooting and Challenges',
    'Beyond Targeting - Applications and Fun Activities',
    'Targeting Your Bird teaches foundational target training principles, fostering trust, communication, and positive reinforcement. Establish a solid training foundation and build a harmonious bond with your bird.',
    'Understanding Bird Behavior explores the intricacies of avian behavior, covering body language, vocalizations, and common bird instincts. Gain insights into your bird needs, emotions, and natural behaviors to enhance your training approach and strengthen your relationship.',
    'Building Basic Commands introduces essential commands such as step-up, step-down, stay, and recall. Learn effective training techniques to teach your bird these fundamental behaviors, promoting obedience, cooperation, and safety.',
    'Problem Solving and Behavior Modification equips you with strategies to address common behavioral issues in birds, including biting, screaming, feather plucking, and territoriality. Discover positive reinforcement techniques and behavior modification methods to promote positive change and resolve challenging behaviors.',
    'Enrichment and Bonding focuses on creating a stimulating environment for your bird through enrichment activities, toys, and socialization. Learn how to provide mental and physical stimulation, promote a healthy lifestyle, and deepen the bond between you and your feathered companion.'
);

INSERT INTO tbl_onlinecourse_detail (
    course_id,
    module_name_1,
    module_name_2,
    module_name_3,
    module_name_4,
    module_name_5,
    module_description_1,
    module_description_2,
    module_description_3,
    module_description_4,
    module_description_5
)
VALUES (
    '15',
    'Introduction to Recall Training',
    'Building Trust and Motivation',
    'Step-by-Step Recall Training',
    'Troubleshooting and Problem Solving',
    'Advanced Recall Training',
    'This module covers the importance of recall training, establishing a positive training environment, and introducing basic concepts and techniques to initiate the recall training process with your parrot.',
    'In this module, you will learn how to develop a strong bond with your parrot, create trust-based training relationships, and explore motivational techniques to make recall training enjoyable and rewarding for your feathered friend.',
    'Step-by-step instructions guide you through the recall training process, including target training, teaching the recall cue, gradually increasing distance and distractions, and reinforcing desired behavior for a reliable recall response.',
    'This module focuses on common challenges in recall training and provides effective troubleshooting strategies. Learn how to address setbacks, deal with distractions, and overcome obstacles to ensure consistent recall success.',
    'In this final module, you will delve into advanced recall training techniques, such as recall from different locations, recall with multiple birds, and enhancing recall reliability in complex environments, further refining your parrot recall abilities.'
);

INSERT INTO tbl_onlinecourse_detail (
    course_id,
    module_name_1,
    module_name_2,
    module_name_3,
    module_name_4,
    module_name_5,
    module_description_1,
    module_description_2,
    module_description_3,
    module_description_4,
    module_description_5
)
VALUES (
    '16',
    'Introduction to Harness Training',
    'Harness Fitting and Desensitization',
    'Positive Reinforcement Training Techniques',
    'Step-by-Step Training Process',
    'Outdoor Adventures',
    'Understand the importance of harness training, learn about different types of harnesses, and discover the benefits of harnessing your parrot for outdoor activities.',
    'Learn how to properly fit a harness on your parrot, introduce your parrot to the harness gradually, and desensitize them to the sensations of wearing it.',
    'Explore effective positive reinforcement techniques to encourage your parrot to associate the harness with positive experiences, making the training process enjoyable for both of you.',
    'Follow a comprehensive step-by-step training process to teach your parrot to willingly put on the harness, accept leash attachment, and become comfortable wearing it.',
    'Discover tips and guidance for taking your harness-trained parrot on outdoor adventures, including safety considerations, advanced training exercises, and troubleshooting common challenges that may arise during outdoor excursions.'
);

INSERT INTO tbl_onlinecourse_detail (
    course_id,
    module_name_1,
    module_name_2,
    module_name_3,
    module_name_4,
    module_name_5,
    module_description_1,
    module_description_2,
    module_description_3,
    module_description_4,
    module_description_5
)
VALUES (
    '17',
    'Understanding Avian Nutrition ',
    'Creating Balanced Meal Plans ',
    'Introducing New Foods',
    'Addressing Diet-Related Health Issues',
    'Optimizing Avian Well-being',
    'Explore the basic principles of avian nutrition, including the specific dietary needs of different bird species and the importance of essential nutrients.',
    'Learn how to design well-rounded meal plans that meet your bird nutritional requirements, incorporating a variety of fresh foods and supplements.',
    'Discover effective strategies for introducing new foods to your bird diet, overcoming picky eating habits, and promoting dietary diversity.',
    'Understand common diet-related health issues in birds and learn preventive measures to minimize the risk of such conditions.',
    'Gain practical tips for maintaining a healthy and balanced diet for your bird, ensuring their overall well-being and longevity.'
);
