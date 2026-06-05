

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

