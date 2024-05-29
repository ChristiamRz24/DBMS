import React, { useRef, useState } from "react";
import File from "../Forms/File.jsx";

const RestoreDB = ({ id, pageName }) => {
  const dialogREF = useRef(null);
  const fileRef = useRef(null);

  const [file, setFile] = useState();
  const [isRestore, setIsRestore] = useState(false);

  const handleSetRestore = () => setIsRestore(!isRestore);
  const handleCloseDialog = () => {
    dialogREF.current.close();
    setIsRestore(false);
  };

  const handleFileChange = () => {
    console.log("fileRef.current.files[0]:", fileRef.current.files[0]);
    setFile(fileRef.current.files[0]);
  };

  if (isRestore) {
    // si no se selecciona un archivo, mostrar una alerta de error
    // y reiniciar el estado de isRestore
    if (!file) {
      alert("Selecciona un archivo de respaldo");
      setIsRestore(false);
      return;
    }

    fetch("/api/postgresql/files/restore.json", {
      method: "POST",
      body: file,
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.success === true) {
          alert(`Base de datos ${pageName} restaurada con éxito!`);
          location.reload();
        } else {
          alert(`Error al restaurar la base de datos ${pageName}`);
        }
        handleCloseDialog();
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  }

  return (
    <dialog
      id={id}
      ref={dialogREF}
      className="modal modal-bottom sm:modal-middle"
    >
      <div className="modal-box">
        <h3 className="font-bold text-lg">Restaurar Base de Datos</h3>
        <div className="modal-action w-full mt-0">
          <button
            type="button"
            onClick={handleCloseDialog}
            className="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
          >
            ✕
          </button>
          <div className="flex flex-col w-full">
            {isRestore && (
              <div className="flex my-10 justify-center items-center gap-2">
                <p className="text-sm">Restaurando base de datos</p>
                <span className="loading loading-dots loading-md"></span>
              </div>
            )}
            {!isRestore && (
              <File
                id="file"
                name="file"
                reference={fileRef}
                onChange={handleFileChange}
                helpText="Solo archivos .sql"
                label="Selecciona un archivo de respaldo"
                client:only="react"
              />
            )}
            <div className="ms-auto">
              <button
                type="button"
                onClick={handleCloseDialog}
                className="btn btn-outline"
              >
                Cancelar
              </button>
              <button
                type="button"
                onClick={handleSetRestore}
                // className="btn btn-accent ms-2"
                className={`btn ${isRestore ? "btn-disabled" : "btn-accent"} ms-2`}
              >
                {isRestore && (
                  <>
                    &nbsp;&nbsp;&nbsp;
                    <span className="loading loading-spinner loading-xs"></span>
                    &nbsp;&nbsp;&nbsp;
                  </>
                )}
                {!isRestore && "Confirmar"}
              </button>
            </div>
          </div>
        </div>
      </div>
    </dialog>
  );
};

export default RestoreDB;
