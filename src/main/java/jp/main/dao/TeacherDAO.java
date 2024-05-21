package jp.main.dao;

import jp.main.model.Teacher;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TeacherDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/tsm";
    private String jdbcUsername = "root";
    private String jdbcPassword = "5041";

    private static final String INSERT_TEACHERS_SQL = "INSERT INTO teachers (id, name, age, sex, course) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_TEACHER_BY_ID = "SELECT id, name, age, sex, course FROM teachers WHERE id = ?";
    private static final String SELECT_ALL_TEACHERS = "SELECT * FROM teachers";
    private static final String DELETE_TEACHERS_SQL = "DELETE FROM teachers WHERE id = ?";
    private static final String UPDATE_TEACHERS_SQL = "UPDATE teachers SET name = ?, age = ?, sex = ?, course = ? WHERE id = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertTeacher(Teacher teacher) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TEACHERS_SQL)) {
            preparedStatement.setInt(1, teacher.getId());
            preparedStatement.setString(2, teacher.getName());
            preparedStatement.setInt(3, teacher.getAge());
            preparedStatement.setString(4, teacher.getSex());
            preparedStatement.setString(5, teacher.getCourse());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Teacher selectTeacher(int id) {
        Teacher teacher = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TEACHER_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String course = rs.getString("course");
                teacher = new Teacher();
                teacher.setId(id);
                teacher.setName(name);
                teacher.setAge(age);
                teacher.setSex(sex);
                teacher.setCourse(course);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return teacher;
    }

    public List<Teacher> selectAllTeachers() {
        List<Teacher> teachers = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TEACHERS)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int age = rs.getInt("age");
                String sex = rs.getString("sex");
                String course = rs.getString("course");
                Teacher teacher = new Teacher();
                teacher.setId(id);
                teacher.setName(name);
                teacher.setAge(age);
                teacher.setSex(sex);
                teacher.setCourse(course);
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return teachers;
    }

    public boolean deleteTeacher(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_TEACHERS_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateTeacher(Teacher teacher) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_TEACHERS_SQL)) {
            statement.setString(1, teacher.getName());
            statement.setInt(2, teacher.getAge());
            statement.setString(3, teacher.getSex());
            statement.setString(4, teacher.getCourse());
            statement.setInt(5, teacher.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}