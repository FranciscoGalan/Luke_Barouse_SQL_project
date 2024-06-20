INSERT INTO job_applied
        (job_id,
        application_sent_date,
        custom_resume,
        resume_file_name,
        cover_letter_sent,
        cover_letter_file_name,
        status)
VALUES  (1,
        '2024-02-01',
        true,
        'resume_01.pdf',
        true,
        'cover_letter_01.pdf',
        'submitted'),
        (2,
        '2024-02-02',
        false,
        'resume_02.pdf',
        NULL,
        'cover_letter_02',
        'not submitted')
;