

CREATE DATABASE IF NOT EXISTS vivaai;
USE vivaai;


-- TABLE 1: STUDENTS

DROP TABLE IF EXISTS answers;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Demo account for testing only. Password hashing is handled in app.py on signup.
-- For production use, register via the signup page instead.
INSERT INTO students (name, email, password)
VALUES ('Test User', 'test@gmail.com', '1234');
-- Demo student
INSERT INTO students (name, email, password)
VALUES ('Test User', 'test@gmail.com', '1234');


-- TABLE 2: QUESTIONS

CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(100),
    topic VARCHAR(100),
    difficulty ENUM('Easy','Medium','Hard'),
    question_text TEXT,
    ideal_answer TEXT
);


-- MACHINE LEARNING QUESTIONS


-- ML EASY
INSERT INTO questions (subject, topic, difficulty, question_text, ideal_answer) VALUES
('ML','Intro','Easy','What is Machine Learning?',
'Machine Learning is a branch of artificial intelligence where systems learn from data to improve their performance on tasks without being explicitly programmed. It builds models that identify patterns and make decisions automatically from experience.'),

('ML','Types','Easy','What are the three types of Machine Learning?',
'The three types are Supervised Learning where the model learns from labeled data with input output pairs, Unsupervised Learning where the model finds hidden patterns in unlabeled data, and Reinforcement Learning where an agent learns by taking actions and receiving rewards or penalties from the environment.'),

('ML','Dataset','Easy','What is a dataset in Machine Learning?',
'A dataset is a structured collection of data used to train validate and test machine learning models. It contains features which are input variables and labels which are output values. The quality size and diversity of a dataset directly determines how well the model will perform on real world tasks.'),

('ML','Prediction','Easy','What is prediction in Machine Learning?',
'Prediction is the process of using a trained machine learning model to estimate an output for new unseen input data. The model applies the patterns it learned during training to generate results such as a category label or a numerical value without being given the correct answer.'),

('ML','Classification','Easy','What is classification in Machine Learning?',
'Classification is a supervised learning task where the model learns to assign input data to predefined categories or classes. Examples include spam detection classifying email as spam or not spam and medical diagnosis classifying a tumor as malignant or benign based on patient data.'),

('ML','Regression','Easy','What is regression in Machine Learning?',
'Regression is a supervised learning technique used to predict continuous numerical output values. For example predicting house prices stock values or temperature. Linear regression models the relationship between input variables and output as a straight line and is the simplest and most common form of regression.'),

('ML','Overfitting','Easy','What is overfitting in Machine Learning?',
'Overfitting occurs when a machine learning model learns the training data too well including its noise and random fluctuations. The model memorizes instead of learning general patterns so it performs very well on training data but fails to generalize and performs poorly on new unseen data.'),

('ML','Underfitting','Easy','What is underfitting in Machine Learning?',
'Underfitting occurs when a model is too simple to capture the underlying patterns in the data. It results in poor performance on both training and test data. This usually happens when the model has too few parameters has not been trained long enough or when important features are missing from the dataset.'),

-- ML MEDIUM
('ML','Overfitting','Medium','What is overfitting and how can it be prevented?',
'Overfitting happens when a model captures noise in training data instead of actual patterns leading to poor generalization on new data. It can be prevented using cross validation to evaluate model performance regularization techniques like L1 Lasso and L2 Ridge to penalize model complexity dropout in neural networks early stopping during training data augmentation to increase dataset size and pruning in decision trees.'),

('ML','Regression','Medium','What is the difference between linear and logistic regression?',
'Linear regression predicts continuous numerical output by fitting a straight line through data points and is used for problems like predicting price or temperature. Logistic regression predicts the probability of a binary outcome using the sigmoid function and is used for binary classification problems like spam detection or disease diagnosis. Despite the word regression in its name logistic regression is a classification algorithm not a regression algorithm.'),

('ML','Dataset','Medium','What is the difference between training validation and test datasets?',
'The training dataset is used to fit the model and learn its parameters. The validation dataset is used during training to tune hyperparameters and monitor for overfitting without touching test data. The test dataset is used only after training is complete to evaluate the final model performance on completely unseen data. This three way separation ensures an unbiased evaluation of the model.'),

('ML','Types','Medium','Explain supervised and unsupervised learning with real world examples.',
'In supervised learning the model is trained on labeled data where each input has a correct output. Real world examples include email spam detection predicting house prices and image classification. In unsupervised learning the model works with unlabeled data to find hidden structure. Real world examples include customer segmentation grouping customers by purchase behavior and anomaly detection finding unusual network traffic patterns.'),

('ML','Classification','Medium','What is the difference between classification and regression?',
'Classification predicts discrete categorical labels such as yes or no spam or not spam or cat or dog. Regression predicts continuous numerical values such as price temperature or salary. Classification uses algorithms like logistic regression decision trees SVM and random forest while regression uses linear regression polynomial regression and gradient boosting. The key difference is the nature of the output variable.'),

('ML','Overfitting','Medium','What is cross validation and why is it used?',
'Cross validation is a technique to evaluate machine learning models reliably by splitting data into multiple folds. In k fold cross validation the data is divided into k equal parts and the model is trained on k minus 1 folds and tested on the remaining fold. This process repeats k times and results are averaged. It gives a more reliable estimate of model performance reduces overfitting risk and makes better use of limited data.'),

-- ML HARD
('ML','NN','Hard','What is a neural network and how does it work?',
'A neural network is a computational model inspired by the human brain consisting of layers of interconnected nodes called neurons. The input layer receives raw data hidden layers apply transformations using weighted connections and activation functions like ReLU or sigmoid and the output layer produces predictions. During training the network minimizes prediction error using backpropagation which calculates gradients via chain rule and gradient descent which updates weights iteratively to converge to minimum loss.'),

('ML','DL','Hard','What is deep learning and how is it different from traditional Machine Learning?',
'Deep learning uses neural networks with many hidden layers called deep neural networks to automatically learn hierarchical representations from raw data. Unlike traditional machine learning which requires manual feature engineering by domain experts deep learning automatically extracts features at multiple levels of abstraction. It excels in image recognition natural language processing and speech recognition but requires large amounts of labeled data significant computational power and longer training times compared to traditional methods.'),

('ML','GD','Hard','What is gradient descent and what are its main variants?',
'Gradient descent is an optimization algorithm that minimizes the loss function by iteratively computing the gradient of the loss with respect to model parameters and updating parameters in the opposite direction of the gradient. Batch gradient descent uses all training samples per update which is stable but slow for large datasets. Stochastic gradient descent uses one random sample per update which is faster but noisy. Mini batch gradient descent uses small random batches balancing speed and stability and is the most commonly used variant in modern deep learning.'),

('ML','Overfitting','Hard','What is the bias variance tradeoff in Machine Learning?',
'The bias variance tradeoff describes the relationship between two sources of prediction error. Bias is error caused by wrong assumptions in the learning algorithm causing the model to miss relevant patterns and underfit the data. Variance is error caused by sensitivity to small fluctuations in training data causing the model to fit noise and overfit. A simple model has high bias and low variance while a complex model has low bias and high variance. The optimal model minimizes total error which is the sum of bias squared plus variance plus irreducible noise.'),

('ML','Regression','Hard','What is regularization in Machine Learning and explain L1 and L2?',
'Regularization is a technique that adds a penalty term to the loss function to prevent overfitting by discouraging models from assigning too much importance to any feature. L1 regularization called Lasso adds the absolute value of coefficients as penalty and can shrink some coefficients to exactly zero performing automatic feature selection making the model sparse. L2 regularization called Ridge adds the squared value of coefficients and shrinks all coefficients evenly without eliminating any. ElasticNet combines both L1 and L2 penalties to get benefits of both methods.'),

('ML','NN','Hard','What is backpropagation in neural networks and how does it work?',
'Backpropagation is the algorithm used to train neural networks by computing gradients of the loss function with respect to each weight using the chain rule of calculus. The process has two phases. In the forward pass input data flows through the network layer by layer to produce a prediction and the loss is calculated. In the backward pass the error is propagated backward through each layer computing partial derivatives of the loss with respect to each weight. These gradients are then used by gradient descent to update weights and reduce loss over many training iterations called epochs.');


-- DBMS QUESTIONS


-- DBMS EASY
INSERT INTO questions (subject, topic, difficulty, question_text, ideal_answer) VALUES
('DBMS','Intro','Easy','What is a Database Management System?',
'A Database Management System or DBMS is software that allows users to create store manage and retrieve data in a structured and efficient way. It provides an interface between users and the database ensuring data is organized consistent and secure. Popular examples include MySQL PostgreSQL Oracle Microsoft SQL Server and MongoDB.'),

('DBMS','Keys','Easy','What is a primary key in a database?',
'A primary key is a column or combination of columns in a table that uniquely identifies each row. It must contain unique values and cannot contain null values. Every table should have a primary key to ensure data integrity and enable efficient data retrieval and relationship building. For example a student ID in a students table uniquely identifies each student record.'),

('DBMS','SQL','Easy','What is SQL and what is it used for?',
'SQL stands for Structured Query Language and is a standard language used to communicate with relational databases. It is used to create and modify database structures using DDL commands like CREATE ALTER and DROP retrieve data using SELECT statements update data using UPDATE and DELETE and control access permissions using DCL commands like GRANT and REVOKE.'),

('DBMS','Tables','Easy','What is the difference between a table and a view in a database?',
'A table is a physical database object that stores actual data permanently in rows and columns on disk. A view is a virtual table that does not store data itself but displays data from one or more tables based on a saved SQL query. Views are used to simplify complex queries restrict data access to sensitive columns and present data in a specific format without duplicating it.'),

('DBMS','Normalization','Easy','What is normalization in databases?',
'Normalization is the process of organizing a relational database to reduce data redundancy and improve data integrity. It involves dividing large tables into smaller related tables and defining relationships between them using foreign keys. The process follows a series of rules called normal forms from 1NF to BCNF each with specific requirements to eliminate different types of data anomalies like insertion deletion and update anomalies.'),

('DBMS','Keys','Easy','What is the difference between primary key and foreign key?',
'A primary key uniquely identifies each record in a table and cannot be null or duplicate. A foreign key is a column in one table that references the primary key of another table creating a relationship between the two tables. Foreign keys enforce referential integrity ensuring that a value in the foreign key column must exist in the referenced primary key column preventing orphan records.'),

('DBMS','SQL','Easy','What is the difference between DELETE and TRUNCATE in SQL?',
'DELETE removes specific rows from a table based on a WHERE condition and can be rolled back using ROLLBACK as it is a DML command that logs individual row deletions. TRUNCATE removes all rows from a table at once and cannot be rolled back as it is a DDL command that deallocates data pages. TRUNCATE is significantly faster than DELETE on large tables because it does not log individual deletions. DELETE fires row level triggers while TRUNCATE does not.'),

('DBMS','Joins','Easy','What is a JOIN in SQL and why is it used?',
'A JOIN in SQL is used to combine rows from two or more tables based on a related column between them. It allows retrieving data that is spread across multiple tables in a single query result. The most common types are INNER JOIN which returns only matching rows from both tables LEFT JOIN which returns all rows from the left table and matching rows from right and FULL OUTER JOIN which returns all rows from both tables with NULL for non matching sides.'),

-- DBMS MEDIUM
('DBMS','Normalization','Medium','Explain 1NF 2NF and 3NF with examples.',
'First Normal Form 1NF requires that each column contain only atomic indivisible values with no repeating groups and each row must be unique. Second Normal Form 2NF requires the table to be in 1NF and every non key attribute must be fully functionally dependent on the entire primary key eliminating partial dependencies that occur in composite keys. Third Normal Form 3NF requires 2NF and no non key attribute should depend on another non key attribute eliminating transitive dependencies. These forms progressively reduce redundancy and prevent data anomalies.'),

('DBMS','Transactions','Medium','What is a transaction in DBMS and what are ACID properties?',
'A transaction is a sequence of database operations treated as a single logical unit of work that must either all succeed or all fail. ACID properties guarantee transaction reliability. Atomicity means the transaction is all or nothing. Consistency ensures the database remains in a valid state before and after the transaction. Isolation means concurrent transactions execute independently without interfering with each other. Durability ensures that once a transaction is committed its changes are permanently saved even if the system crashes immediately after.'),

('DBMS','Joins','Medium','Explain the different types of JOINs in SQL.',
'INNER JOIN returns only rows where there is a matching value in both tables. LEFT JOIN returns all rows from the left table and matched rows from the right table with NULL for unmatched right rows. RIGHT JOIN returns all rows from the right table and matched rows from the left with NULL for unmatched left rows. FULL OUTER JOIN returns all rows from both tables with NULL where there is no match on either side. CROSS JOIN returns the Cartesian product combining every row from first table with every row from second table.'),

('DBMS','Indexing','Medium','What is indexing in databases and why is it important?',
'Indexing is a data structure technique that improves the speed of data retrieval operations on a database table by creating a separate optimized structure pointing to row locations. An index works like a book index helping the database engine find rows without scanning every record. It significantly speeds up SELECT queries and WHERE clause lookups but slows down INSERT UPDATE and DELETE operations because the index must also be updated. Common types include B tree indexes for general use and hash indexes for equality lookups.'),

('DBMS','Keys','Medium','What is the difference between unique key and primary key?',
'A primary key uniquely identifies each record cannot contain NULL values and there can only be one primary key per table. A unique key also ensures uniqueness of values in a column but unlike primary key it can contain one NULL value and a table can have multiple unique keys. Both enforce uniqueness at the column level but the primary key is the main identifier of records and is typically used as the target of foreign key references from other tables.'),

('DBMS','SQL','Medium','What is the difference between WHERE and HAVING clause in SQL?',
'The WHERE clause filters individual rows before any grouping or aggregation occurs and cannot be used with aggregate functions like COUNT SUM AVG MIN or MAX. The HAVING clause filters groups of rows after the GROUP BY operation and is specifically designed to work with aggregate functions. For example WHERE salary greater than 50000 filters individual employee rows while HAVING AVG salary greater than 50000 filters department groups based on their average salary after grouping.'),

-- DBMS HARD
('DBMS','Transactions','Hard','What are isolation levels in database transactions?',
'Isolation levels define how much a transaction is isolated from other concurrent transactions and what anomalies are allowed. Read Uncommitted is the lowest level allowing dirty reads where a transaction reads uncommitted changes from another transaction. Read Committed prevents dirty reads but allows non repeatable reads where the same query returns different results within a transaction. Repeatable Read prevents dirty and non repeatable reads but allows phantom reads where new rows appear in repeated queries. Serializable is the strictest level preventing all anomalies by executing transactions as if they were fully sequential at the cost of reduced concurrency.'),

('DBMS','Normalization','Hard','What is BCNF and how is it different from 3NF?',
'Boyce Codd Normal Form BCNF is a stronger version of 3NF that handles certain anomalies 3NF cannot. A relation is in BCNF if for every non trivial functional dependency X determines Y X must be a superkey of the relation. The key difference from 3NF is that 3NF allows functional dependencies where the dependent attribute Y is a prime attribute meaning part of a candidate key while BCNF does not permit this exception. BCNF eliminates all redundancy based on functional dependencies but unlike 3NF it may not always preserve all original functional dependencies after decomposition.'),

('DBMS','Indexing','Hard','What is the difference between clustered and non clustered index?',
'A clustered index determines the physical storage order of data rows in the table itself meaning the table data is sorted and stored on disk according to the clustered index key. There can be only one clustered index per table since data can only be physically sorted one way. A non clustered index creates a completely separate data structure containing the index key values and pointers to the actual data rows stored elsewhere. A table can have multiple non clustered indexes. Clustered indexes are faster for range queries and ordered retrieval while non clustered indexes add flexibility for lookups on non primary columns.'),

('DBMS','SQL','Hard','What are stored procedures and triggers in SQL?',
'A stored procedure is a precompiled named collection of SQL statements stored permanently in the database that can be executed as a single reusable unit. It accepts input parameters returns output reduces network traffic by executing on the server and improves performance through execution plan reuse. A trigger is a special database object that automatically executes a predefined set of SQL statements in response to specific data modification events like INSERT UPDATE or DELETE on a table. Triggers are used to enforce complex business rules maintain audit logs synchronize tables and ensure data integrity automatically without requiring application code changes.'),

('DBMS','Transactions','Hard','What is deadlock in DBMS and how can it be prevented?',
'A deadlock occurs when two or more transactions are permanently waiting for each other to release locks creating a circular dependency where none of them can ever proceed. For example Transaction A holds a lock on Table 1 and waits for Table 2 while Transaction B holds a lock on Table 2 and waits for Table 1 causing both to wait forever. Prevention strategies include lock ordering where all transactions must acquire locks in the same predefined order timeout mechanisms that automatically abort transactions waiting beyond a threshold deadlock detection algorithms that periodically scan for cycles in the wait for graph and two phase locking protocol that ensures all locks are acquired before any lock is released.');

USE vivaai;

-- ─── OS EASY ────────────────────────────────────────────────────────────────

INSERT INTO questions (subject, topic, difficulty, question_text, ideal_answer) VALUES

('OS','Basics','Easy','What is an operating system and what are its functions?',
'An operating system is system software that manages computer hardware and software resources and provides services for programs. Its main functions are process management which creates schedules and terminates processes, memory management which allocates and deallocates memory to processes, file system management which organizes stores and retrieves files, device management which controls input output devices through drivers, and security management which controls access to resources. Examples include Windows Linux and macOS.'),

('OS','Process','Easy','What is a process in an operating system?',
'A process is a program in execution. It includes the program code current activity represented by program counter stack containing temporary data data section containing global variables and heap for dynamic memory allocation. Each process has its own memory space and resources. A process is different from a program — a program is a passive entity stored on disk while a process is an active entity being executed by the CPU.'),

('OS','Process','Easy','What are the different states of a process?',
'A process goes through five states. New is when the process is being created. Ready is when the process is waiting to be assigned to the CPU. Running is when the process is being executed by the CPU. Waiting or Blocked is when the process is waiting for an event like I/O completion. Terminated is when the process has finished execution. The OS scheduler moves processes between ready running and waiting states based on scheduling algorithms and events.'),

('OS','Process','Easy','What is the difference between process and thread?',
'A process is an independent program with its own memory space code data and resources. A thread is the smallest unit of execution within a process. Multiple threads in a process share the same memory space and resources making communication between threads faster than between processes. Threads are lighter than processes taking less time to create context switch and terminate. A process can have multiple threads running concurrently. Creating a new process is expensive while creating a thread is cheap.'),

('OS','Process','Easy','What is a context switch?',
'A context switch is the process of saving the state of a currently running process and loading the saved state of another process so it can run. The state saved includes the program counter registers stack pointer and memory mappings stored in the Process Control Block PCB. Context switching is pure overhead as no useful work is done during it. It occurs during interrupts system calls and when the scheduler preempts a process after its time quantum expires.'),

('OS','Memory','Easy','What is virtual memory?',
'Virtual memory is a memory management technique that allows a computer to use more memory than physically available RAM by using disk space as an extension. It gives each process the illusion of having a large contiguous private memory space. Pages of memory are moved between RAM and disk as needed through paging. Benefits include running programs larger than physical RAM, memory isolation between processes, and efficient memory sharing. The downside is slower access when pages must be fetched from disk.'),

('OS','Memory','Easy','What is the difference between internal and external fragmentation?',
'Internal fragmentation occurs when allocated memory block is larger than what the process requested leaving unused space inside the allocated region. For example allocating 4KB when only 3KB was needed wastes 1KB internally. External fragmentation occurs when free memory exists in small non-contiguous blocks so a large request cannot be satisfied even though total free memory is sufficient. Paging eliminates external fragmentation. Compaction can solve external fragmentation but is expensive.'),

('OS','Scheduling','Easy','What is CPU scheduling and why is it needed?',
'CPU scheduling is the mechanism by which the OS decides which process from the ready queue gets to execute on the CPU next. It is needed because multiple processes compete for the single CPU resource. Goals of scheduling include maximizing CPU utilization keeping CPU busy as much as possible, maximizing throughput number of processes completed per unit time, minimizing turnaround time total time from submission to completion, minimizing waiting time time spent in ready queue, and minimizing response time time until first response.'),

('OS','Scheduling','Easy','What is the difference between preemptive and non-preemptive scheduling?',
'In preemptive scheduling the OS can forcibly remove the CPU from a running process before it completes. This happens when a higher priority process arrives or time quantum expires. Examples are Round Robin and Preemptive Priority scheduling. In non-preemptive scheduling once a process gets the CPU it runs until it voluntarily gives up the CPU by completing or blocking for I/O. Examples are FCFS and non-preemptive SJF. Preemptive gives better response time for interactive systems but has higher context switch overhead.'),

('OS','Deadlock','Easy','What is a deadlock?',
'A deadlock is a situation where two or more processes are permanently blocked each waiting for a resource held by another process in the same group. None can proceed forward. For example Process A holds Resource 1 and waits for Resource 2 while Process B holds Resource 2 and waits for Resource 1 — both wait forever. Deadlock requires four conditions to hold simultaneously: mutual exclusion, hold and wait, no preemption, and circular wait. Breaking any one condition prevents deadlock.'),

('OS','Deadlock','Easy','What are the four necessary conditions for deadlock?',
'Mutual Exclusion means at least one resource must be held in a non-shareable mode — only one process can use it at a time. Hold and Wait means a process holding at least one resource is waiting to acquire more resources held by other processes. No Preemption means resources cannot be forcibly taken from a process — they must be voluntarily released. Circular Wait means a circular chain of processes exists where each process waits for a resource held by the next process in the chain. All four must hold simultaneously for deadlock.'),

('OS','Synchronization','Easy','What is a semaphore?',
'A semaphore is an integer synchronization variable used to control access to shared resources. It supports two atomic operations: wait also called P which decrements the value and blocks if value becomes negative, and signal also called V which increments the value and wakes a blocked process. Binary semaphore has values 0 or 1 and works like a mutex lock for mutual exclusion. Counting semaphore tracks available instances of a resource allowing multiple processes to access simultaneously up to the count limit.'),

('OS','Synchronization','Easy','What is a mutex?',
'A mutex is a mutual exclusion lock that ensures only one thread can access a shared resource at a time. The thread that locks the mutex must be the one to unlock it providing ownership semantics. This differs from a semaphore which can be signaled by any thread. A mutex has two states locked and unlocked. When a thread tries to lock an already locked mutex it blocks until the owning thread unlocks it. Mutexes are used to protect critical sections in multithreaded programs preventing race conditions.'),

('OS','Memory','Easy','What is paging?',
'Paging is a memory management scheme that eliminates external fragmentation by dividing logical memory into fixed size blocks called pages and physical memory into same size blocks called frames. When a process runs its pages are loaded into any available frames not necessarily contiguous. The OS maintains a page table for each process that maps page numbers to frame numbers. The CPU uses the page table to translate logical addresses to physical addresses. Paging allows efficient memory utilization but each memory access requires an extra page table lookup.'),

('OS','FileSystem','Easy','What is a file system?',
'A file system is the method and data structure an OS uses to organize store and retrieve data on storage devices. It manages files and directories tracks which disk blocks belong to which files handles file metadata like name size owner and permissions and controls read write access. Common file systems include NTFS and FAT32 for Windows, ext4 and xfs for Linux, and APFS for macOS. Without a file system data on disk would be an unorganized blob with no way to identify where one file ends and another begins.'),

('OS','Kernel','Easy','What is the kernel?',
'The kernel is the core component of an operating system that has complete control over everything in the system. It manages communication between hardware and software, handles process scheduling and memory management, provides system calls for user programs to request OS services, and manages device drivers. The kernel runs in privileged kernel mode with full hardware access. User programs run in restricted user mode and must request kernel services through system calls. The kernel is always resident in memory while the OS is running.'),

('OS','Kernel','Easy','What is the difference between kernel mode and user mode?',
'Kernel mode is a privileged CPU execution mode where the OS kernel runs with unrestricted access to all hardware instructions and memory. User mode is a restricted execution mode where user applications run with limited access preventing them from directly accessing hardware or critical memory regions. This separation protects the OS from buggy or malicious user programs. When a user program needs OS services like file I/O or memory allocation it makes a system call which triggers a mode switch from user mode to kernel mode and back.'),

('OS','Process','Easy','What is PCB — Process Control Block?',
'A Process Control Block is a data structure maintained by the OS for every process containing all information about that process. It stores process ID, process state, program counter, CPU registers, memory management information like page tables, scheduling information like priority, I/O status information, and accounting information like CPU time used. When a context switch occurs the current process state is saved into its PCB and the next process state is restored from its PCB. PCB is the representation of a process in the OS.'),

('OS','Memory','Easy','What is a page fault?',
'A page fault occurs when a running process tries to access a page that is not currently loaded in physical memory RAM. The CPU generates a page fault interrupt and the OS takes over. The OS finds the required page on disk, loads it into a free frame in RAM, updates the page table, and resumes the process. Page faults cause significant delays because disk access is much slower than RAM. Too many page faults cause thrashing where the system spends more time handling page faults than executing processes.'),

('OS','Scheduling','Easy','What is FCFS scheduling?',
'FCFS First Come First Served is the simplest CPU scheduling algorithm where processes are executed in the order they arrive in the ready queue. It is non-preemptive — once a process starts it runs to completion. It is easy to implement using a simple queue. The main disadvantage is the convoy effect where short processes get stuck waiting behind long processes causing high average waiting time. For example if a long process of 100ms arrives before short processes of 2ms each, all short processes wait unnecessarily. FCFS is used in batch systems not interactive systems.'),

-- ─── OS MEDIUM ───────────────────────────────────────────────────────────────

('OS','Scheduling','Medium','Explain Round Robin scheduling with example.',
'Round Robin is a preemptive CPU scheduling algorithm designed for time-sharing systems. Each process gets a fixed time slice called time quantum typically 10-100ms. If a process does not complete within its quantum it is preempted and added to the back of the ready queue. Example with quantum 4ms: P1 burst 24ms, P2 burst 3ms, P3 burst 3ms. Order: P1 runs 4ms, P2 runs 3ms finishes, P3 runs 3ms finishes, P1 runs remaining 20ms in 5 more rounds. Average waiting time is better than FCFS. Performance depends on quantum — too small causes excessive context switching overhead, too large behaves like FCFS.'),

('OS','Scheduling','Medium','Explain SJF scheduling and its types.',
'Shortest Job First schedules the process with the smallest CPU burst time next. Non-preemptive SJF lets the current process finish then picks shortest next. Preemptive SJF called Shortest Remaining Time First preempts the running process if a new process arrives with shorter remaining time. SJF gives the minimum average waiting time among all scheduling algorithms making it theoretically optimal. The main problem is that burst times are not known in advance and must be predicted using exponential averaging of past bursts. Long processes can starve if short processes keep arriving.'),

('OS','Memory','Medium','What is paging and how does address translation work?',
'Paging divides logical address space into fixed size pages and physical memory into same size frames. A logical address has two parts: page number and page offset. The OS maintains a page table per process mapping page numbers to frame numbers. Address translation: CPU generates logical address, extracts page number, looks up page table to find frame number, combines frame number with offset to get physical address. A Translation Lookaside Buffer TLB is a fast cache for recent page table entries. TLB hit gives fast translation, TLB miss requires page table lookup adding overhead.'),

('OS','Deadlock','Medium','What are deadlock prevention and deadlock avoidance?',
'Deadlock prevention eliminates one of the four necessary conditions. Eliminating mutual exclusion by making resources shareable where possible. Eliminating hold and wait by requiring processes to request all resources at once before starting. Eliminating no preemption by forcibly taking resources from waiting processes. Eliminating circular wait by imposing a total ordering on resources and requiring processes to request in order. Deadlock avoidance allows resource requests but uses algorithms like Bankers algorithm to check if granting a request leaves the system in a safe state. Safe state means a sequence exists where all processes can complete.'),

('OS','Synchronization','Medium','What is the critical section problem?',
'The critical section is a code segment where shared resources are accessed. The critical section problem requires a solution satisfying three conditions. Mutual exclusion means only one process can be in its critical section at a time. Progress means if no process is in its critical section and some want to enter, selection cannot be postponed indefinitely. Bounded waiting means a bound must exist on how many times other processes can enter before a waiting process gets in. Solutions include Peterson algorithm for two processes, semaphores, mutex locks, and hardware atomic instructions like test-and-set and compare-and-swap.'),

('OS','Memory','Medium','What is the difference between paging and segmentation?',
'Paging divides memory into fixed size pages transparent to programmer eliminating external fragmentation but causing internal fragmentation. Logical addresses are flat with no programmer-visible structure. Segmentation divides memory into variable size segments matching program logical structure like code segment, data segment, stack segment, and heap. Programmer has visibility into segments. Segmentation causes external fragmentation but no internal fragmentation. Segmentation gives better protection since each segment has its own access rights. Modern systems like x86 use segmented paging combining both approaches for benefits of both.'),

('OS','Process','Medium','What is inter-process communication?',
'Inter-process communication IPC allows processes to exchange data and synchronize. Shared memory is the fastest method where processes map a common memory region and communicate by reading and writing it but requires synchronization to avoid race conditions. Message passing uses OS-mediated send and receive calls suitable for distributed systems but slower due to kernel involvement. Pipes provide a unidirectional byte stream between related processes. Named pipes allow communication between unrelated processes. Sockets support communication between processes on same or different machines over a network. Signals asynchronously notify processes of events.'),

('OS','Memory','Medium','What are page replacement algorithms?',
'When a page fault occurs and no free frame is available the OS must replace an existing page. FIFO First In First Out replaces the oldest page in memory — simple but suffers Beladys anomaly where more frames can cause more faults. LRU Least Recently Used replaces the page not used for the longest time — good approximation of optimal but expensive to implement exactly. Optimal replaces the page that will not be used for the longest time in future — gives best performance but requires future knowledge so used only as benchmark. Clock algorithm approximates LRU using reference bits efficiently.'),

('OS','Scheduling','Medium','What is starvation and how is it prevented?',
'Starvation occurs when a process waits indefinitely because higher priority processes keep arriving and taking the CPU. It commonly occurs in priority scheduling where low priority processes never execute. Aging is the standard solution — gradually increase the priority of processes that have been waiting for a long time. For example increase priority by 1 for every 15 minutes of waiting. Eventually the starving process gets high enough priority to execute. Round Robin prevents starvation by giving every process equal time slices in rotation. Multilevel feedback queue uses aging and dynamic priority adjustment.'),

('OS','FileSystem','Medium','What is an inode in Linux?',
'An inode is a data structure in Linux file systems storing all metadata about a file except its name and data. It contains file size, owner UID and GID, file permissions, timestamps for creation modification and access, number of hard links pointing to this inode, and direct and indirect pointers to data blocks on disk. Every file has exactly one inode with a unique inode number. A directory maps file names to inode numbers. When you delete a file the directory entry is removed but the inode and data blocks are freed only when the link count reaches zero meaning all hard links are removed.'),

('OS','Synchronization','Medium','What is the producer consumer problem?',
'The producer consumer problem is a classic synchronization problem where producer processes generate data and place it in a shared buffer and consumer processes remove and process data from the buffer. Problems occur when producers try to add to a full buffer or consumers try to remove from an empty buffer. The solution uses three semaphores: mutex for mutual exclusion on buffer access, empty counting available empty slots initialized to buffer size, and full counting available filled slots initialized to zero. Producer does wait empty then wait mutex then add item then signal mutex then signal full. Consumer does wait full then wait mutex then remove item then signal mutex then signal empty.'),

('OS','Memory','Medium','What is demand paging?',
'Demand paging is a virtual memory technique where pages are loaded into physical memory only when they are needed not all at once when the process starts. When a process starts only a minimal set of pages is loaded. When the process accesses a page not in memory a page fault occurs and the OS loads that page from disk. Benefits include faster process startup since not all pages need loading, less memory usage since only actively used pages are in RAM, and ability to run programs larger than physical memory. The performance depends on the page fault rate — too many faults cause thrashing.'),

-- ─── OS HARD ─────────────────────────────────────────────────────────────────

('OS','Memory','Hard','Explain thrashing and how to prevent it.',
'Thrashing occurs when a process spends more time handling page faults than executing useful code causing severe CPU utilization drop. It happens when the OS over-commits memory giving processes fewer frames than their working set requires. Each process constantly page faults, the OS spends all time swapping pages, CPU utilization collapses. The working set model prevents thrashing by tracking the set of pages a process actively uses in a recent window of time and allocating at least that many frames. Page fault frequency control adds frames when fault rate exceeds upper threshold and removes when below lower threshold. Reducing multiprogramming degree by suspending some processes also helps.'),

('OS','Scheduling','Hard','Compare FCFS SJF Round Robin and Priority scheduling.',
'FCFS is simple non-preemptive but causes convoy effect giving poor average waiting time especially when long processes arrive first. SJF gives optimal minimum average waiting time but requires knowing burst times in advance and causes starvation of long processes. Preemptive SJF called SRTF further minimizes waiting time but causes more context switches. Round Robin is fair preemptive and good for interactive systems — every process gets CPU time but average waiting time is higher than SJF and performance depends on quantum size. Priority scheduling serves urgent processes first but causes starvation solved by aging. Real OS like Linux use Completely Fair Scheduler combining these concepts with dynamic priorities and weighted fair queuing.'),

('OS','Deadlock','Hard','Explain the Bankers algorithm for deadlock avoidance.',
'The Bankers algorithm checks whether granting a resource request leaves the system in a safe state. It maintains for each process: maximum needs, currently allocated resources, and remaining needs. Available resources are tracked globally. When a process requests resources the algorithm temporarily allocates them and runs the safety algorithm. Safety algorithm finds a safe sequence — an ordering of all processes where each process can get its remaining needs met using currently available resources plus resources freed by processes earlier in the sequence. If a safe sequence exists the allocation is granted. If not the process must wait. The algorithm prevents deadlock but requires advance knowledge of maximum needs and can be conservative denying safe requests.'),

('OS','Synchronization','Hard','Explain the dining philosophers problem and solutions.',
'Five philosophers sit at a circular table with one chopstick between each pair. Each needs two chopsticks to eat. If all pick up left chopstick simultaneously all wait for right chopstick causing deadlock. Solution 1: Allow only four philosophers to sit at once breaking circular wait condition. Solution 2: Asymmetric solution where odd numbered philosophers pick left then right while even numbered pick right then left preventing circular wait. Solution 3: Monitor solution where philosopher picks both chopsticks atomically only if both are available otherwise waits. Solution 4: Semaphore solution using one semaphore per chopstick and a room semaphore limiting simultaneous attempts. The problem illustrates that naive resource allocation leads to deadlock and starvation.'),

('OS','Memory','Hard','What is the Translation Lookaside Buffer and why is it important?',
'The Translation Lookaside Buffer TLB is a small high speed hardware cache inside the CPU that stores recent virtual to physical address translations from the page table. Without TLB every memory access requires two memory accesses: one to look up the page table and one for the actual data doubling memory access time. With TLB the CPU first checks if the translation is cached — a TLB hit gives the physical address in one CPU cycle. A TLB miss requires a page table walk which takes multiple memory accesses then the result is cached in TLB for future use. TLB hit rates of 95-99% are typical making average memory access time close to single access. TLB is flushed on context switch since different processes have different address spaces.'),

('OS','Synchronization','Hard','What are race conditions and how are they prevented?',
'A race condition occurs when multiple threads or processes access shared data concurrently and the final result depends on the order of execution which is non-deterministic. For example two threads both reading a counter value of 5 both incrementing it and both writing 6 — the counter should be 7 but race condition gives 6. Race conditions are prevented using synchronization primitives. Mutex locks ensure only one thread accesses critical section at a time. Semaphores control access to resources with multiple instances. Atomic operations perform read-modify-write as a single uninterruptible instruction. Lock-free programming uses compare-and-swap instructions. Immutable shared data needs no synchronization since it is never modified.'),

('OS','Memory','Hard','Explain memory mapped files and their advantages.',
'Memory mapped files map file contents directly into the virtual address space of a process. Instead of using read and write system calls the process accesses file data using normal memory operations — the OS handles loading and saving pages from the file transparently. Advantages include faster access since data is accessed directly without system call overhead for each operation. Multiple processes can map the same file sharing physical pages automatically enabling efficient inter-process communication. The OS handles caching and lazy loading automatically. Large files can be processed without loading entirely into RAM. Disadvantages include wasted virtual address space for very large files and potential for subtle bugs if multiple processes write to the same mapped region without synchronization.'),

('OS','Process','Hard','What is the difference between multiprogramming multitasking multiprocessing and multithreading?',
'Multiprogramming keeps multiple programs loaded in memory simultaneously so when one blocks for I/O another runs keeping CPU busy — maximizes CPU utilization on single CPU. Multitasking is time-shared multiprogramming where the OS rapidly switches CPU between processes giving illusion of simultaneous execution on a single CPU — enables interactive use. Multiprocessing uses multiple physical CPUs or cores to execute processes truly simultaneously — increases throughput and reliability. Multithreading divides a single process into multiple threads that run concurrently sharing the process memory — enables parallelism within a single application. Modern systems combine all four: multiple cores each running time-shared processes each of which can have multiple threads.');


-- ─── CN EASY ─────────────────────────────────────────────────────────────────

INSERT INTO questions (subject, topic, difficulty, question_text, ideal_answer) VALUES

('CN','Basics','Easy','What is a computer network?',
'A computer network is a collection of interconnected devices such as computers printers and servers that can communicate and share resources with each other. Networks allow sharing of data files printers and internet connections. Networks are classified by size as LAN Local Area Network covering a small area like an office, MAN Metropolitan Area Network covering a city, and WAN Wide Area Network covering large geographic areas like the internet.'),

('CN','Basics','Easy','What is the difference between LAN MAN and WAN?',
'LAN Local Area Network covers a small geographic area like a room building or campus. It has high speed typically 100Mbps to 10Gbps low latency and is privately owned. Examples include home networks and office networks. MAN Metropolitan Area Network covers a city or large campus using fiber optic cables. WAN Wide Area Network covers large geographic areas across cities countries or globally. It uses public infrastructure and is slower than LAN. The internet is the largest WAN. Cost and speed decrease while coverage area increases from LAN to MAN to WAN.'),

('CN','OSI','Easy','What is the OSI model?',
'The OSI Open Systems Interconnection model is a conceptual framework that standardizes how different network systems communicate. It has seven layers. Physical layer transmits raw bits over physical medium. Data Link layer handles node to node data transfer and error detection. Network layer handles routing and logical addressing using IP. Transport layer provides end to end communication and reliability using TCP UDP. Session layer manages connections between applications. Presentation layer handles data formatting encryption and compression. Application layer provides network services to end user applications like HTTP FTP and SMTP.'),

('CN','OSI','Easy','What are the seven layers of the OSI model?',
'The seven layers from bottom to top are: Layer 1 Physical which deals with raw bit transmission over cables and wireless signals. Layer 2 Data Link which handles framing MAC addressing and error detection using protocols like Ethernet. Layer 3 Network which handles logical IP addressing and routing between networks. Layer 4 Transport which provides reliable end to end delivery using TCP or fast unreliable delivery using UDP. Layer 5 Session which establishes maintains and terminates communication sessions. Layer 6 Presentation which handles data encryption compression and format conversion. Layer 7 Application which provides interfaces for user applications like HTTP HTTPS FTP DNS and SMTP.'),

('CN','Protocols','Easy','What is the difference between TCP and UDP?',
'TCP Transmission Control Protocol is connection-oriented — it establishes a connection through a three-way handshake before data transfer. It provides reliable ordered delivery with error checking and retransmission of lost packets. It is slower due to overhead. Used for web browsing email and file transfer where accuracy matters. UDP User Datagram Protocol is connectionless — it sends packets without establishing a connection. It provides no guarantee of delivery order or error checking. It is faster with lower overhead. Used for video streaming online gaming and DNS where speed matters more than perfect reliability.'),

('CN','Protocols','Easy','What is HTTP and HTTPS?',
'HTTP HyperText Transfer Protocol is the foundation of data communication on the web. It is a request response protocol where a client browser sends requests and a server sends responses. It operates at the Application layer. HTTP is stateless meaning each request is independent. HTTPS HTTP Secure adds a security layer using SSL TLS encryption to protect data in transit. HTTPS ensures confidentiality preventing eavesdropping, integrity ensuring data is not tampered, and authentication verifying the server identity through certificates. All modern websites should use HTTPS especially for login and payment pages.'),

('CN','Addressing','Easy','What is an IP address?',
'An IP address is a unique numerical label assigned to each device on a network used to identify and locate it. IPv4 addresses are 32-bit numbers written as four decimal numbers separated by dots like 192.168.1.1 supporting about 4.3 billion addresses. IPv6 addresses are 128-bit written in hexadecimal supporting virtually unlimited addresses to overcome IPv4 exhaustion. IP addresses have two parts: network portion identifying the network and host portion identifying the specific device. Private IP addresses are used within local networks while public IP addresses are used on the internet.'),

('CN','Addressing','Easy','What is the difference between IPv4 and IPv6?',
'IPv4 uses 32-bit addresses written in dotted decimal notation like 192.168.0.1 supporting about 4.3 billion unique addresses. IPv6 uses 128-bit addresses written in hexadecimal like 2001:0db8:85a3::8a2e:0370:7334 supporting 340 undecillion addresses solving IPv4 exhaustion. IPv6 has built-in security with mandatory IPSec support simplified header for faster routing no need for NAT and better support for mobile devices. IPv4 still dominates the internet but IPv6 adoption is growing. Most modern systems support dual stack running both simultaneously.'),

('CN','Basics','Easy','What is a protocol in networking?',
'A protocol is a set of rules and conventions that define how data is transmitted and received over a network. Protocols specify the format of data packets how devices establish connections how errors are detected and corrected and how data flow is controlled. Without protocols different devices and systems could not communicate. Examples include TCP IP for internet communication, HTTP for web browsing, SMTP for email, FTP for file transfer, and DNS for domain name resolution. Protocols operate at different layers of the OSI model each handling specific aspects of communication.'),

('CN','Devices','Easy','What is the difference between hub switch and router?',
'A hub is a basic networking device that broadcasts incoming data to all connected devices regardless of destination — creates a shared collision domain and is inefficient. A switch is smarter — it learns MAC addresses and forwards data only to the intended recipient port creating separate collision domains for each port improving efficiency and security. A router connects different networks and routes packets between them using IP addresses. It determines the best path for data to travel across networks. Routers operate at Layer 3 Network layer while switches operate at Layer 2 and hubs at Layer 1.'),

('CN','Protocols','Easy','What is DNS?',
'DNS Domain Name System is a hierarchical distributed naming system that translates human readable domain names like www.google.com into IP addresses like 142.250.80.46 that computers use to communicate. Without DNS users would need to memorize IP addresses for every website. When you type a URL your browser queries a DNS resolver which contacts root servers then TLD servers then authoritative name servers to find the IP address. DNS records include A records mapping domain to IPv4, AAAA for IPv6, MX for mail servers, and CNAME for aliases. DNS uses UDP port 53.'),

('CN','Addressing','Easy','What is a MAC address?',
'A MAC Media Access Control address is a unique hardware identifier permanently assigned to a network interface card by the manufacturer. It is a 48-bit address written as six pairs of hexadecimal digits like 00:1A:2B:3C:4D:5E. MAC addresses operate at Layer 2 Data Link layer and are used for communication within the same local network. Unlike IP addresses which can change MAC addresses are fixed to the hardware. Switches use MAC address tables to forward frames to correct ports. ARP Address Resolution Protocol resolves IP addresses to MAC addresses within a local network.'),

-- ─── CN MEDIUM ───────────────────────────────────────────────────────────────

('CN','OSI','Medium','Explain the TCP IP model and how it differs from OSI.',
'The TCP IP model has four layers compared to OSI seven layers. Network Access layer combines OSI Physical and Data Link layers handling hardware addressing and physical transmission. Internet layer corresponds to OSI Network layer handling IP addressing and routing. Transport layer same as OSI handling TCP and UDP. Application layer combines OSI Session Presentation and Application layers. TCP IP is the practical model actually used on the internet while OSI is a theoretical reference model. TCP IP was developed first from real protocols while OSI was designed as a generic framework. TCP IP has fewer layers making it simpler to implement.'),

('CN','Protocols','Medium','Explain the TCP three-way handshake.',
'The TCP three-way handshake establishes a reliable connection before data transfer. Step 1 SYN: Client sends a SYN synchronize packet to server with a random sequence number indicating it wants to connect. Step 2 SYN-ACK: Server responds with SYN-ACK synchronize-acknowledge packet acknowledging the client SYN and sending its own sequence number. Step 3 ACK: Client sends an ACK acknowledge packet confirming receipt of server SYN-ACK. After this three-step exchange a full-duplex connection is established and data transfer begins. Connection termination uses a four-way handshake with FIN and ACK packets. This process ensures both sides are ready to communicate reliably.'),

('CN','Addressing','Medium','What is subnetting and why is it used?',
'Subnetting divides a large network into smaller sub-networks called subnets. A subnet mask determines which portion of an IP address identifies the network and which identifies the host. For example 255.255.255.0 or slash 24 means the first 24 bits are network and last 8 bits are host allowing 254 hosts. Benefits include efficient IP address utilization by allocating only needed addresses to each subnet, improved security by isolating network segments, reduced broadcast traffic since broadcasts stay within a subnet, and better network management by organizing devices logically. CIDR Classless Inter-Domain Routing notation like 192.168.1.0/24 represents subnets compactly.'),

('CN','Protocols','Medium','What is ARP and how does it work?',
'ARP Address Resolution Protocol resolves a known IP address to an unknown MAC address within a local network. When a device wants to send data to an IP address it first checks its ARP cache for the corresponding MAC address. If not found it broadcasts an ARP request asking who has this IP address. The device with that IP address replies with its MAC address. The requesting device stores this mapping in its ARP cache for future use. ARP operates at Layer 2 and works only within the same subnet. For devices on different networks the router MAC address is returned. Gratuitous ARP is sent by a device announcing its own IP-MAC mapping to update other devices caches.'),

('CN','Security','Medium','What is a firewall?',
'A firewall is a network security device that monitors and controls incoming and outgoing network traffic based on predefined security rules. It creates a barrier between trusted internal networks and untrusted external networks. Packet filtering firewalls examine individual packets and allow or deny based on source destination IP addresses and ports. Stateful inspection firewalls track active connections and make decisions based on connection state. Application layer firewalls inspect traffic at the application layer understanding specific protocols. Next-generation firewalls NGFW combine traditional firewall capabilities with deep packet inspection intrusion prevention and application awareness.'),

('CN','Protocols','Medium','What is DHCP and how does it work?',
'DHCP Dynamic Host Configuration Protocol automatically assigns IP addresses and network configuration to devices on a network. Without DHCP administrators would manually configure IP addresses on every device. Process uses DORA: Discovery — client broadcasts DHCP discover packet seeking a server. Offer — DHCP server responds with an IP address offer. Request — client broadcasts acceptance of the offer. Acknowledge — server confirms the lease of the IP address. DHCP also provides subnet mask default gateway DNS server addresses and lease duration. The lease expires after the set time and the client must renew or get a new address. DHCP uses UDP ports 67 server and 68 client.'),

('CN','Addressing','Medium','What is NAT and why is it needed?',
'NAT Network Address Translation allows multiple devices on a private network to share a single public IP address when accessing the internet. Private IP ranges like 192.168.x.x and 10.x.x.x are not routable on the internet. NAT is performed by the router which maintains a translation table mapping private IP and port combinations to the public IP and different port numbers. When a response comes back the router uses the table to forward it to the correct private device. NAT conserves IPv4 addresses since millions of private devices share one public IP. It also provides a basic security layer since private addresses are hidden from the internet.'),

('CN','OSI','Medium','What happens when you type a URL in a browser?',
'DNS resolution converts the domain name to an IP address by querying DNS servers. TCP connection is established with the web server using a three-way handshake. If HTTPS a TLS handshake is performed to establish an encrypted connection. HTTP GET request is sent to the server for the requested page. Server processes the request and sends back HTTP response with HTML content and status code 200 OK. Browser parses HTML and makes additional requests for CSS JavaScript and images. Browser renders the page displaying it to the user. This entire process involves multiple OSI layers working together from Application layer HTTP down to Physical layer network cables.'),

('CN','Protocols','Medium','What is the difference between HTTP and FTP?',
'HTTP HyperText Transfer Protocol is designed for transferring web pages and web resources. It is stateless uses a single connection for request and response and operates on port 80 HTTPS on 443. It transfers HTML CSS JavaScript and images. FTP File Transfer Protocol is designed specifically for file transfer between computers. It uses two connections: control connection on port 21 for commands and data connection on port 20 for actual file transfer. FTP supports operations like list directory change directory upload and download files. FTP sends credentials in plain text making it insecure — SFTP and FTPS are secure alternatives. HTTP is for web browsing while FTP is for dedicated file transfer.'),

-- ─── CN HARD ─────────────────────────────────────────────────────────────────

('CN','Protocols','Hard','Explain SSL TLS and how HTTPS works.',
'SSL Secure Sockets Layer and its successor TLS Transport Layer Security are cryptographic protocols that provide secure communication over a network. HTTPS uses TLS to encrypt HTTP traffic. The TLS handshake process: Client sends ClientHello with supported TLS versions and cipher suites. Server responds with ServerHello choosing cipher suite and sends its digital certificate containing public key. Client verifies the certificate with a Certificate Authority. Client generates a pre-master secret encrypts it with server public key and sends it. Both sides derive the same session keys from the pre-master secret. All subsequent communication is encrypted with symmetric encryption using those session keys. This provides confidentiality integrity and authentication.'),

('CN','Addressing','Hard','Explain routing algorithms — distance vector and link state.',
'Distance vector routing uses the Bellman-Ford algorithm where each router maintains a table of distances to all destinations and shares it with neighbors. Routers update their tables based on neighbor information. RIP Routing Information Protocol uses hop count as metric with maximum 15 hops. Problems include slow convergence and count-to-infinity problem. Link state routing uses Dijkstra algorithm where each router floods the entire network with its local topology information. Every router builds a complete map of the network and computes shortest paths independently. OSPF Open Shortest Path First uses link state. Link state converges faster and is more accurate but requires more memory and processing. Modern networks prefer link state protocols.'),

('CN','Security','Hard','What are common network attacks and how are they prevented?',
'DDoS Distributed Denial of Service floods a server with traffic from many sources making it unavailable. Prevention uses rate limiting traffic scrubbing and CDN distribution. Man in the Middle MITM attack intercepts communication between two parties. Prevention uses end to end encryption TLS and certificate pinning. SQL injection sends malicious SQL through web forms to manipulate databases. Prevention uses parameterized queries and input validation. Phishing tricks users into revealing credentials through fake websites. Prevention uses email filters and user education. ARP spoofing sends fake ARP replies to associate attacker MAC with legitimate IP enabling traffic interception. Prevention uses dynamic ARP inspection on switches. Port scanning discovers open ports to find vulnerabilities. Prevention uses firewalls and intrusion detection systems.'),

('CN','Protocols','Hard','What is BGP and how does internet routing work?',
'BGP Border Gateway Protocol is the routing protocol that makes the internet work by routing traffic between autonomous systems AS which are large networks operated by ISPs and organizations. Each AS has a unique AS number. BGP routers called border routers exchange routing information about which IP prefixes are reachable through which AS path. BGP selects routes based on policies and attributes like AS path length local preference and MED. BGP is a path vector protocol maintaining the full AS path to detect and prevent routing loops. iBGP is used within an AS and eBGP between different AS. BGP convergence is slow by design for stability. BGP hijacking attacks can redirect internet traffic which is mitigated using RPKI Resource Public Key Infrastructure.'),

('CN','OSI','Hard','Explain congestion control in TCP.',
'TCP congestion control prevents a sender from overwhelming the network. Slow Start begins with a small congestion window cwnd of 1 MSS and doubles it each round trip time until it reaches the slow start threshold ssthresh or packet loss occurs. Congestion Avoidance increases cwnd linearly by 1 MSS per RTT after reaching ssthresh providing additive increase. When packet loss is detected by timeout TCP resets cwnd to 1 and halves ssthresh — multiplicative decrease. When loss is detected by three duplicate ACKs TCP uses Fast Retransmit and Fast Recovery — halves cwnd and ssthresh and enters congestion avoidance without going back to slow start. Modern TCP variants like TCP Cubic and BBR use more sophisticated algorithms measuring bandwidth and round trip time rather than just reacting to packet loss.'),

('CN','Security','Hard','What is a VPN and how does it work?',
'A VPN Virtual Private Network creates an encrypted tunnel between a user device and a VPN server over the public internet making it appear as if the user is on a private network. When a user connects to a VPN their traffic is encrypted before leaving their device sent through the tunnel to the VPN server which decrypts it and forwards it to the destination. The response returns to the VPN server encrypted and sent back through the tunnel. This hides the user real IP address showing the VPN server IP instead and encrypts traffic from ISP surveillance. Protocols include OpenVPN using TLS for strong security, IPSec for site to site VPNs, WireGuard a modern lightweight protocol and L2TP PPTP older less secure protocols. VPNs are used for remote work accessing private corporate networks and privacy protection.');
-- TABLE 3: ANSWERS

CREATE TABLE answers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    question_id INT,
    student_answer TEXT,
    score FLOAT,
    classification ENUM('Strong','Average','Weak'),
    weak_topic_flag BOOLEAN DEFAULT FALSE,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);


-- INDEXES

CREATE INDEX idx_topic ON questions(topic);
CREATE INDEX idx_difficulty ON questions(difficulty);
CREATE INDEX idx_subject ON questions(subject);


-- SUMMARY
-- Total Questions: 37
-- ML Questions: 20 (7 Easy, 6 Medium, 7 Hard)
-- DBMS Questions: 17 (7 Easy, 5 Medium, 5 Hard)

