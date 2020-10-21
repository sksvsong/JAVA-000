/**
 * @author svsong
 * @create 2020-10-21 14:05
 * 自定义一个 Classloader，加载一个 Hello.xlass 文件，执行 hello 方法，
 * 此文件内容是一个 Hello.class 文件所有字节（x=255-x）处理后的文件
 */

import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.net.URISyntaxException;

public class HelloClassLoader extends ClassLoader {

    public static void main(String[] args) {
        try {
            Class<?> clazz = new HelloClassLoader().findClass("Hello");
            clazz.getMethod("hello", null).invoke(clazz.newInstance());
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {
        String path = null;
        try {
            path = HelloClassLoader.class.getResource("Hello.xlass").toURI().getPath();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }

        byte[] xlassBytes = xlass2BytesAyyay(new File(path));
        byte[] newXlassBytes = changeXlassBytes(xlassBytes);

        return defineClass(name, newXlassBytes, 0, newXlassBytes.length);
    }

    private byte[] changeXlassBytes(byte[] xlassBytes) {
        byte[] newBytes = new byte[xlassBytes.length];

        for (int i = 0; i < xlassBytes.length; i++) {
            newBytes[i] = (byte) (255 - xlassBytes[i]);
        }

        return newBytes;
    }

    private byte[] xlass2BytesAyyay(File file) {
        byte[] xlassBytesArray = null;

        try (FileInputStream fis = new FileInputStream(file);
             ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            int len = 0;
            byte[] buffer = new byte[1024];
            while ((len = fis.read(buffer)) != -1) {
                baos.write(buffer, 0, len);
            }
            xlassBytesArray = baos.toByteArray();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return xlassBytesArray;
    }

}