const fetchData = async (url) => {
  try {
    const response = await fetch(url);
    // `http://localhost:4321/api/${pageName}/tables/names.json`,
    return await response.json();
  } catch (error) {
    console.error("Error fetching data:", error);
    return []; // Retorna un arreglo vacío en caso de error
  }
};

export default fetchData;
