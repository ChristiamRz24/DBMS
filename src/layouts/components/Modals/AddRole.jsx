import React, { useRef } from "react";
import postData from "../../../services/postData";

const AddRole = ({ id, type, title, pageName, children }) => {
  const dialogREF = useRef(null);

  const handleSubmit = async (event) => {
    event.preventDefault();

    const role = new FormData(event.target);
    const addRoleURL = `http://localhost:4321/api/${pageName}/roles/add.json`;

    try {
      // response = Role created | Role already exists
      const response = await postData(addRoleURL, role);

      if (response.message === "Role created") location.reload();
      if (response.message === "Role already exists") alert("El rol ya existe");
    } catch (error) {
      console.error(error);
    }

    handleCloseDialog();
  };

  const handleCloseDialog = () => dialogREF.current.close();

  return (
    <dialog
      id={id}
      ref={dialogREF}
      className="modal modal-bottom sm:modal-middle"
    >
      <div className="modal-box">
        <h3 className="font-bold text-lg">{title}</h3>
        <div className="modal-action w-full mt-0">
          <button
            type="button"
            onClick={handleCloseDialog}
            className="btn btn-sm btn-circle btn-ghost absolute right-2 top-2"
          >
            X {/* Close icon */}
          </button>
          <form
            method="dialog"
            onSubmit={handleSubmit}
            className="flex flex-col gap-3 w-full"
          >
            {/* Form fields */}
            {children}
            {/* Form actions */}
            <div className="ms-auto">
              <button
                type="button"
                className="btn btn-outline"
                onClick={handleCloseDialog}
              >
                Cancelar
              </button>
              <button type="submit" className="btn btn-accent ms-1">
                {type}
              </button>
            </div>
          </form>
        </div>
      </div>
    </dialog>
  );
};

export default AddRole;
