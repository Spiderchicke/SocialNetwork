package common;

import lombok.SneakyThrows;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.function.Supplier;

@FunctionalInterface
public interface ConnectionPool extends Supplier<Connection>, AutoCloseable {

    BlockingQueue<PooledConnection> getConnectionQueue();

    @SneakyThrows
    static ConnectionPool create(String pathToConfig) {

        Properties properties = new Properties();
        properties.load(new FileInputStream(pathToConfig));

        Class.forName(getValueAndRemoveKey(properties, "driver"));
        String url = getValueAndRemoveKey(properties, "url");
        int poolSize = Integer.parseInt(getValueAndRemoveKey(properties, "poolSize"));

        BlockingQueue<PooledConnection> connectionQueue = new ArrayBlockingQueue<>(poolSize);

        for (int i = 0; i < poolSize; i++)
            connectionQueue.add(
                    PooledConnection.create(
                            DriverManager.getConnection(url, properties),
                            connectionQueue));

        return () -> connectionQueue;
    }

    static String getValueAndRemoveKey(Properties properties, String key) {
        return (String) properties.remove(key);
    }

    @Override
    @SneakyThrows
    default Connection get() {
        return getConnectionQueue().take();
    }

    @Override
    default void close() throws Exception {
        getConnectionQueue().forEach(connection -> {
            try {
                connection.reallyClose();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        });
    }
}