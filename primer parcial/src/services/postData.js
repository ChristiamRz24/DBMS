export default async function postData(url, data) {
  try {
    const response = await fetch(url, {
      method: "POST",
      body: data,
    });

    return await response.json();
  } catch (error) {
    console.error(error);
    throw error;
  }
}
