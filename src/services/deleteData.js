export default async function deleteData(url, data) {
  try {
    const response = await fetch(url, {
      method: "DELETE",
      body: data,
    });

    return await response.json();
  } catch (error) {
    console.error(error);
    throw error;
  }
}
