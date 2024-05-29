export default async function putData(url, data) {
  try {
    const response = await fetch(url, {
      method: "PUT",
      body: data,
    });

    return await response.json();
  } catch (error) {
    console.error(error);
    throw error;
  }
}
