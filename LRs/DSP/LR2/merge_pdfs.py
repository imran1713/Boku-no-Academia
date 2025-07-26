import PyPDF2
import os

def merge_pdfs(cover_path, main_path, output_path):
    """
    Merge cover PDF and main PDF into a single document
    """
    try:
        # Create a PDF writer object
        pdf_writer = PyPDF2.PdfWriter()
        
        # Read the cover PDF
        with open(cover_path, 'rb') as cover_file:
            cover_reader = PyPDF2.PdfReader(cover_file)
            print(f"Cover PDF has {len(cover_reader.pages)} page(s)")
            
            # Add all pages from cover PDF
            for page_num in range(len(cover_reader.pages)):
                page = cover_reader.pages[page_num]
                pdf_writer.add_page(page)
                print(f"Added cover page {page_num + 1}")
        
        # Read the main PDF
        with open(main_path, 'rb') as main_file:
            main_reader = PyPDF2.PdfReader(main_file)
            print(f"Main PDF has {len(main_reader.pages)} page(s)")
            
            # Add all pages from main PDF
            for page_num in range(len(main_reader.pages)):
                page = main_reader.pages[page_num]
                pdf_writer.add_page(page)
                print(f"Added main page {page_num + 1}")
        
        # Write the merged PDF
        with open(output_path, 'wb') as output_file:
            pdf_writer.write(output_file)
        
        print(f"\nSuccessfully merged PDFs!")
        print(f"Output file: {output_path}")
        print(f"Total pages: {len(pdf_writer.pages)}")
        
    except Exception as e:
        print(f"Error during PDF merging: {e}")
        return False
    
    return True

if __name__ == "__main__":
    # Get the directory where this script is located
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # File paths (relative to script location)
    cover_pdf = os.path.join(script_dir, "cover.pdf")
    main_pdf = os.path.join(script_dir, "LR2.pdf")
    output_pdf = os.path.join(script_dir, "2010058_DSP_LR2.pdf")
    
    # Check if input files exist
    if not os.path.exists(cover_pdf):
        print(f"Error: {cover_pdf} not found!")
        exit(1)
    
    if not os.path.exists(main_pdf):
        print(f"Error: {main_pdf} not found!")
        exit(1)
    
    print("Starting PDF merge process...")
    print(f"Cover PDF: {cover_pdf}")
    print(f"Main PDF: {main_pdf}")
    print(f"Output PDF: {output_pdf}")
    print("-" * 50)
    
    # Perform the merge
    success = merge_pdfs(cover_pdf, main_pdf, output_pdf)
    
    if success:
        print("-" * 50)
        print("PDF merge completed successfully!")
        print(f"Merged file saved as: {output_pdf}")
    else:
        print("PDF merge failed!")
