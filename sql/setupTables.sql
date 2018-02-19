# Users
CREATE TABLE Users
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    emailVerified BOOLEAN DEFAULT 0,
    verifyEmailCode VARCHAR(36) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created DATETIME DEFAULT CURRENT_TIMESTAMP  NOT NULL
);
CREATE UNIQUE INDEX Users_email_uindex ON Users (email);


# User Groups
CREATE TABLE UserGroups
(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
);
CREATE UNIQUE INDEX Groups_name_uindex ON UserGroups (name);


# User UserGroup Cross Reference Table
CREATE TABLE UserUserGroupsXRef
(
    userId INT NOT NULL,
    groupId INT NOT NULL,
    CONSTRAINT User_fk FOREIGN KEY (userId) REFERENCES Users (id) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT Group_fk FOREIGN KEY (groupId) REFERENCES UserGroups (id) ON DELETE CASCADE ON UPDATE CASCADE
);