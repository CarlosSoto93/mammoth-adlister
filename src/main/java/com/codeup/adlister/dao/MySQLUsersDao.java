package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;


public class MySQLUsersDao implements Users {
    private Connection connection = null;

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to database!", e);
        }

    }

    @Override
    public User findByUsername(String username) {
        String sql = "SELECT * FROM users WHERE username = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());

        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public Long insert(User user) {
        try {
            String sql = "INSERT INTO users (username, email, password) VALUES(?,?,?)";
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
            // you can copy/paste the following 3 lines for other insert methods
            ResultSet keys = stmt.getGeneratedKeys();
            keys.next();
            return keys.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new User(
                rs.getLong("id"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("password")
        );
    }
}
