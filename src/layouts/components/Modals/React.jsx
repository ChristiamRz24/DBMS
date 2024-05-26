import { useRef } from "react";

const ModalReact = ({ id, type, title, onSubmit, children }) => {
  const dialogREF = useRef(null);
  const formREF = useRef(null);

  const handleSubmit = (event) => {
    event.preventDefault();
    onSubmit();
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
            ref={formREF}
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

export default ModalReact;
