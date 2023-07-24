<%@page import="java.io.File"%>
<%
                                                try {
                                                    String filePath = "c:\\temp";
                                                    File file = new File(filePath);
                                                    File files[] = file.listFiles();
                                                    int i = 0;
                                                    for (int j = files.length; i < j; i++) {
                                                        File arquivo = files[i];
                                                        if(arquivo.getName().endsWith)
                                   byte[] fileContent = FileUtils.readFileToByteArray(new File(filePath + "\\" + arquivo.getName()));
                                                            String encodedString = Base64.getEncoder().encodeToString(fileContent);
                                                            