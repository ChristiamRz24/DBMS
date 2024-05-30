import React, { useRef, useState } from "react";

const BackupDB = ({ id, pageName }) => {
  const dialogREF = useRef(null);
  const [isBackup, setIsBackup] = useState(false);

  const handleSetBackup = () => setIsBackup(!isBackup);
  const handleCloseDialog = () => {
    dialogREF.current.close();
    setIsBackup(false);
  };

  if (isBackup) {
    fetch(`/api/${pageName}/files/backup.json`)
      .then((response) => response.json())
      .then((data) => {
        // obtener el nombre del archivo de respaldo
        const { fileName } = data;

        // crear un enlace de descarga
        const a = document.createElement("a");
        a.href = `/files/${fileName}`;
        console.log("a.href:", a.href);
        a.download = fileName;
        a.click();

        handleCloseDialog();

        alert(`Base de datos ${pageName} respaldada con éxito!`);
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
        <h3 className="font-bold text-lg">Respaldar Base de Datos</h3>
        <div className="modal-action w-full mt-0">
          <button
            type="button"
            onClick={handleCloseDialog}
            className="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
          >
            ✕
          </button>
          <div className="flex flex-col w-full">
            {isBackup && (
              <div className="flex my-10 justify-center items-center gap-2">
                <p className="text-sm">Respaldando base de datos</p>
                <span className="loading loading-dots loading-md"></span>
              </div>
            )}
            {!isBackup && (
              <p className="text-sm text-center my-10">
                ¿Desea respaldar la base de datos <strong>{pageName}</strong>?
              </p>
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
                onClick={handleSetBackup}
                // className="btn btn-accent ms-2"
                className={`btn ${isBackup ? "btn-disabled" : "btn-accent"} ms-2`}
              >
                {isBackup && (
                  <>
                    &nbsp;&nbsp;&nbsp;
                    <span className="loading loading-spinner loading-xs"></span>
                    &nbsp;&nbsp;&nbsp;
                  </>
                )}
                {!isBackup && "Confirmar"}
              </button>
            </div>
          </div>
        </div>
      </div>
    </dialog>
  );
};

export default BackupDB;
