import tkinter as tk
from tkinter import Toplevel, messagebox, ttk
from PIL import Image, ImageTk
from backend.auditoriaTriggers import crear_tabla_auditoria, generar_triggers, listar_entidades
from backend.procesoHilos import comparar_consultas, get_fixed_queries

# Centrar la ventana principal
def center_window(window, width, height):
    screen_width = window.winfo_screenwidth()
    screen_height = window.winfo_screenheight()
    x = (screen_width // 2) - (width // 2)
    y = (screen_height // 2) - (height // 2)
    window.geometry(f'{width}x{height}+{x}+{y}')

# Funciones de Auditoria utilizando Triggers
def populate_entities(tree):
    entities = listar_entidades()
    for entity, attributes in entities.items():
        attributes_str = ', '.join(attributes)
        tree.insert("", tk.END, text=entity, values=(attributes_str,))

def crear_tabla_auditoria_wrapper():
    crear_tabla_auditoria()

def generate_triggers_wrapper(tree):
    selected_items = tree.selection()
    entities = [tree.item(item, "text") for item in selected_items]
    generar_triggers(entities)

def auditoriaTriggers():
    root = tk.Tk()
    root.title("Generar Disparadores de Auditoría")

    # Centrar la ventana
    screen_width = root.winfo_screenwidth()
    screen_height = root.winfo_screenheight()
    window_width = 1200
    window_height = 500
    position_top = int(screen_height / 2 - window_height / 2)
    position_right = int(screen_width / 2 - window_width / 2)
    root.geometry(f'{window_width}x{window_height}+{position_right}+{position_top}')
    root.configure(bg="#BB5D5E") 

    label = tk.Label(root, text="Entidades y Atributos:", bg="#BB5D5E", fg='white', font=("Arial", 12))
    label.pack(pady=5)

    tree_frame = ttk.Frame(root)
    tree_frame.pack(pady=5, fill=tk.BOTH, expand=True)

    tree = ttk.Treeview(tree_frame, columns=("Atributos"), show="tree headings")
    tree.heading("#0", text="Entidad")
    tree.heading("Atributos", text="Atributos")
    tree.column("#0", width=200, anchor="w")
    tree.column("Atributos", width=900, anchor="w")
    tree.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

    scrollbar = ttk.Scrollbar(tree_frame, orient=tk.VERTICAL, command=tree.yview)
    tree.configure(yscroll=scrollbar.set)
    scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

    populate_entities(tree)

    create_table_button = tk.Button(root, text="Crear Tabla de Auditoría", bg="#6e3139", fg='white', font=("Arial", 10),
                                     command=crear_tabla_auditoria_wrapper)
    create_table_button.pack(pady=5)

    generate_button = tk.Button(root, text="Generar Disparadores", bg="#6e3139", fg='white', font=("Arial", 10),
                                 command=lambda: generate_triggers_wrapper(tree))
    generate_button.pack(pady=5)

# Funciones de Procesos en Multiples Hilos
def toggle_option(option_var, textbox):
    if option_var.get() == "fixed":
        textbox.config(state=tk.DISABLED)
    else:
        textbox.config(state=tk.NORMAL)

def comparar_consultas_wrapper(textbox, thread_entry, option_var, root):
    num_threads = thread_entry.get()
    if not num_threads.isdigit():
        messagebox.showwarning("Advertencia", "Ingrese una cantidad válida de hilos.")
        return

    num_threads = int(num_threads)

    if option_var.get() == "fixed":
        queries = get_fixed_queries()
    else:
        queries_text = textbox.get("1.0", tk.END).strip()
        if not queries_text:
            messagebox.showwarning("Advertencia", "Ingrese al menos una consulta.")
            return
        queries = queries_text.split("\n")

    results = comparar_consultas(queries, num_threads)
    mostrar_resultados(queries, results, root)

def mostrar_resultados(queries, results, root):
    result_window = tk.Toplevel(root)
    result_window.title("Resultados de Comparación de Consultas")

    columns = ["Consulta"] + [f"Hilo {i+1}" for i in range(len(results[0]))]
    tree = ttk.Treeview(result_window, columns=columns, show='headings')
    tree.pack(fill=tk.BOTH, expand=True)

    tree.heading("Consulta", text="Consulta")
    for i in range(len(results[0])):
        tree.heading(f"Hilo {i+1}", text=f"Hilo {i+1}")

    for i, query in enumerate(queries):
        row = [query] + [f"{results[i][j][1]:.4f}" if results[i][j] else "Error" for j in range(len(results[i]))]
        tree.insert("", tk.END, values=row)

    scrollbar = ttk.Scrollbar(result_window, orient="horizontal", command=tree.xview)
    tree.configure(xscrollcommand=scrollbar.set)
    scrollbar.pack(fill=tk.X, expand=False)

def procesosHilos():
    hilos_window = Toplevel(root)
    hilos_window.title("Comparación de Consultas")

    screen_width = hilos_window.winfo_screenwidth()
    screen_height = hilos_window.winfo_screenheight()
    window_width = 600
    window_height = 350
    position_top = int(screen_height / 2 - window_height / 2)
    position_right = int(screen_width / 2 - window_width / 2)
    hilos_window.geometry(f'{window_width}x{window_height}+{position_right}+{position_top}')
    hilos_window.configure(bg="#BB5D5E") 

    frame = tk.Frame(hilos_window, bg="#BB5D5E")
    frame.pack(padx=10, pady=10)

    option_var = tk.StringVar(value="custom")  # Cambiar a "custom"

    fixed_option = tk.Radiobutton(frame, text="Usar consultas fijas", bg="#BB5D5E", variable=option_var,
                                  value="fixed", command=lambda: toggle_option(option_var, textbox))
    fixed_option.pack(anchor=tk.W)

    custom_option = tk.Radiobutton(frame, text="Usar consultas personalizadas", bg="#BB5D5E",
                                   variable=option_var, value="custom", command=lambda: toggle_option(option_var, textbox))
    custom_option.pack(anchor=tk.W)

    query_frame = tk.Frame(frame)
    query_frame.pack(fill=tk.BOTH, expand=True)

    label = tk.Label(query_frame, text="Ingrese las consultas a comparar (una por línea):")
    label.pack()

    textbox = tk.Text(query_frame, height=10, width=50)
    textbox.pack()
    textbox.focus_set()  # Asegura que el textbox tenga el foco

    thread_label = tk.Label(frame, text="Cantidad de hilos:", bg="#BB5D5E", fg='white', font=("Arial", 12))
    thread_label.pack()

    thread_entry = tk.Entry(frame)
    thread_entry.pack()

    compare_button = tk.Button(frame, text="Comparar Consultas", bg="#6e3139", fg='white', font=("Arial", 10),
                               command=lambda: comparar_consultas_wrapper(textbox, thread_entry, option_var, root))
    compare_button.pack(pady=5)

    toggle_option(option_var, textbox)  # Asegurarse de que el textbox esté en el estado correcto

# Crear la ventana principal
root = tk.Tk()
root.title("Sistema de Gestión")
center_window(root, 400, 300)
root.configure(bg="#BB5D5E") 
frame = tk.Frame(root, bg="#BB5D5E")
frame.pack(padx=80)
selected_attributes = []
# Cargar el logo de la app
logo_path = "LogoU.png"  # Reemplaza con la ruta a tu logo
logo_image = Image.open(logo_path)
logo_image = logo_image.resize((190, 100), Image.LANCZOS)  # Ajusta el tamaño del logo si es necesario
logo_photo = ImageTk.PhotoImage(logo_image)
logo_label = tk.Label(frame, image=logo_photo, bg="#BB5D5E")
logo_label.pack()
label = tk.Label(frame, text="Segundo Parcial:", bg="#BB5D5E", fg='white', font=("Arial", 12))
label.pack(pady=5)
btn_auditoria_triggers = tk.Button(frame, text="Triggers para Auditoria", bg="#6e3139", fg='white', font=("Arial", 10),
                                   command=auditoriaTriggers)
btn_procesos_hilos = tk.Button(frame, text="Procesos en Hilos", bg="#6e3139", fg='white', font=("Arial", 10),
                               command=procesosHilos)

btn_auditoria_triggers.pack(pady=10)
btn_procesos_hilos.pack(pady=10)

# Iniciar el bucle principal de la interfaz gráfica
root.mainloop()