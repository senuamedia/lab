; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"my_sqrt"(i64 %x) nounwind {
entry:
  %local.g.9 = alloca i64
  %local.i.10 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t11 = load i64, ptr %local.x
  %t12 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.2)
  %t13 = call i64 @"sx_f64_le"(i64 %t11, i64 %t12)
  %t14 = icmp ne i64 %t13, 0
  br i1 %t14, label %then1, label %else1
then1:
  %t15 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.3)
  ret i64 %t15
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t16 = phi i64 [ 0, %else1_end ]
  %t17 = load i64, ptr %local.x
  store i64 %t17, ptr %local.g.9
  store i64 0, ptr %local.i.10
  br label %loop2
loop2:
  %t18 = load i64, ptr %local.i.10
  %t19 = icmp slt i64 %t18, 30
  %t20 = zext i1 %t19 to i64
  %t21 = icmp ne i64 %t20, 0
  br i1 %t21, label %body2, label %endloop2
body2:
  %t22 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.4)
  %t23 = load i64, ptr %local.g.9
  %t24 = load i64, ptr %local.x
  %t25 = load i64, ptr %local.g.9
  %t26 = call i64 @"sx_f64_div"(i64 %t24, i64 %t25)
  %t27 = call i64 @"sx_f64_add"(i64 %t23, i64 %t26)
  %t28 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t27)
  store i64 %t28, ptr %local.g.9
  %t29 = load i64, ptr %local.i.10
  %t30 = add i64 %t29, 1
  store i64 %t30, ptr %local.i.10
  br label %loop2
endloop2:
  %t31 = load i64, ptr %local.g.9
  ret i64 %t31
}

define i64 @"my_pow"(i64 %base, i64 %exp) nounwind {
entry:
  %local.r.32 = alloca i64
  %local.i.33 = alloca i64
  %local.base = alloca i64
  store i64 %base, ptr %local.base
  %local.exp = alloca i64
  store i64 %exp, ptr %local.exp
  %t34 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.5)
  store i64 %t34, ptr %local.r.32
  store i64 0, ptr %local.i.33
  br label %loop3
loop3:
  %t35 = load i64, ptr %local.i.33
  %t36 = load i64, ptr %local.exp
  %t37 = icmp slt i64 %t35, %t36
  %t38 = zext i1 %t37 to i64
  %t39 = icmp ne i64 %t38, 0
  br i1 %t39, label %body3, label %endloop3
body3:
  %t40 = load i64, ptr %local.r.32
  %t41 = load i64, ptr %local.base
  %t42 = call i64 @"sx_f64_mul"(i64 %t40, i64 %t41)
  store i64 %t42, ptr %local.r.32
  %t43 = load i64, ptr %local.i.33
  %t44 = add i64 %t43, 1
  store i64 %t44, ptr %local.i.33
  br label %loop3
endloop3:
  %t45 = load i64, ptr %local.r.32
  ret i64 %t45
}

define i64 @"ksq"(i64 %kx, i64 %ky, i64 %kz) nounwind {
entry:
  %local.fx.46 = alloca i64
  %local.fy.47 = alloca i64
  %local.fz.48 = alloca i64
  %local.kx = alloca i64
  store i64 %kx, ptr %local.kx
  %local.ky = alloca i64
  store i64 %ky, ptr %local.ky
  %local.kz = alloca i64
  store i64 %kz, ptr %local.kz
  %t49 = load i64, ptr %local.kx
  %t50 = call i64 @"sx_int_to_f64"(i64 %t49)
  store i64 %t50, ptr %local.fx.46
  %t51 = load i64, ptr %local.ky
  %t52 = call i64 @"sx_int_to_f64"(i64 %t51)
  store i64 %t52, ptr %local.fy.47
  %t53 = load i64, ptr %local.kz
  %t54 = call i64 @"sx_int_to_f64"(i64 %t53)
  store i64 %t54, ptr %local.fz.48
  %t55 = load i64, ptr %local.fx.46
  %t56 = load i64, ptr %local.fx.46
  %t57 = call i64 @"sx_f64_mul"(i64 %t55, i64 %t56)
  %t58 = load i64, ptr %local.fy.47
  %t59 = load i64, ptr %local.fy.47
  %t60 = call i64 @"sx_f64_mul"(i64 %t58, i64 %t59)
  %t61 = call i64 @"sx_f64_add"(i64 %t57, i64 %t60)
  %t62 = load i64, ptr %local.fz.48
  %t63 = load i64, ptr %local.fz.48
  %t64 = call i64 @"sx_f64_mul"(i64 %t62, i64 %t63)
  %t65 = call i64 @"sx_f64_add"(i64 %t61, i64 %t64)
  ret i64 %t65
}

define i64 @"dot3"(i64 %ax, i64 %ay, i64 %az, i64 %bx, i64 %by, i64 %bz) nounwind {
entry:
  %local.r.66 = alloca i64
  %local.ax = alloca i64
  store i64 %ax, ptr %local.ax
  %local.ay = alloca i64
  store i64 %ay, ptr %local.ay
  %local.az = alloca i64
  store i64 %az, ptr %local.az
  %local.bx = alloca i64
  store i64 %bx, ptr %local.bx
  %local.by = alloca i64
  store i64 %by, ptr %local.by
  %local.bz = alloca i64
  store i64 %bz, ptr %local.bz
  %t67 = load i64, ptr %local.ax
  %t68 = load i64, ptr %local.bx
  %t69 = mul i64 %t67, %t68
  %t70 = load i64, ptr %local.ay
  %t71 = load i64, ptr %local.by
  %t72 = mul i64 %t70, %t71
  %t73 = add i64 %t69, %t72
  %t74 = load i64, ptr %local.az
  %t75 = load i64, ptr %local.bz
  %t76 = mul i64 %t74, %t75
  %t77 = add i64 %t73, %t76
  %t78 = call i64 @"sx_int_to_f64"(i64 %t77)
  store i64 %t78, ptr %local.r.66
  %t79 = load i64, ptr %local.r.66
  ret i64 %t79
}

define i64 @"sin2_angle"(i64 %qx, i64 %qy, i64 %qz, i64 %kx, i64 %ky, i64 %kz) nounwind {
entry:
  %local.qk.80 = alloca i64
  %local.q2.81 = alloca i64
  %local.k2.82 = alloca i64
  %local.cos2.83 = alloca i64
  %local.qx = alloca i64
  store i64 %qx, ptr %local.qx
  %local.qy = alloca i64
  store i64 %qy, ptr %local.qy
  %local.qz = alloca i64
  store i64 %qz, ptr %local.qz
  %local.kx = alloca i64
  store i64 %kx, ptr %local.kx
  %local.ky = alloca i64
  store i64 %ky, ptr %local.ky
  %local.kz = alloca i64
  store i64 %kz, ptr %local.kz
  %t84 = load i64, ptr %local.qx
  %t85 = load i64, ptr %local.qy
  %t86 = load i64, ptr %local.qz
  %t87 = load i64, ptr %local.kx
  %t88 = load i64, ptr %local.ky
  %t89 = load i64, ptr %local.kz
  %t90 = call i64 @"dot3"(i64 %t84, i64 %t85, i64 %t86, i64 %t87, i64 %t88, i64 %t89)
  store i64 %t90, ptr %local.qk.80
  %t91 = load i64, ptr %local.qx
  %t92 = load i64, ptr %local.qy
  %t93 = load i64, ptr %local.qz
  %t94 = call i64 @"ksq"(i64 %t91, i64 %t92, i64 %t93)
  store i64 %t94, ptr %local.q2.81
  %t95 = load i64, ptr %local.kx
  %t96 = load i64, ptr %local.ky
  %t97 = load i64, ptr %local.kz
  %t98 = call i64 @"ksq"(i64 %t95, i64 %t96, i64 %t97)
  store i64 %t98, ptr %local.k2.82
  %t99 = load i64, ptr %local.q2.81
  %t100 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.6)
  %t101 = call i64 @"sx_f64_lt"(i64 %t99, i64 %t100)
  %t102 = icmp ne i64 %t101, 0
  br i1 %t102, label %then4, label %else4
then4:
  %t103 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.7)
  ret i64 %t103
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t104 = phi i64 [ 0, %else4_end ]
  %t105 = load i64, ptr %local.k2.82
  %t106 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.8)
  %t107 = call i64 @"sx_f64_lt"(i64 %t105, i64 %t106)
  %t108 = icmp ne i64 %t107, 0
  br i1 %t108, label %then5, label %else5
then5:
  %t109 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.9)
  ret i64 %t109
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t110 = phi i64 [ 0, %else5_end ]
  %t111 = load i64, ptr %local.qk.80
  %t112 = load i64, ptr %local.qk.80
  %t113 = call i64 @"sx_f64_mul"(i64 %t111, i64 %t112)
  %t114 = load i64, ptr %local.q2.81
  %t115 = load i64, ptr %local.k2.82
  %t116 = call i64 @"sx_f64_mul"(i64 %t114, i64 %t115)
  %t117 = call i64 @"sx_f64_div"(i64 %t113, i64 %t116)
  store i64 %t117, ptr %local.cos2.83
  %t118 = load i64, ptr %local.cos2.83
  %t119 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.10)
  %t120 = call i64 @"sx_f64_gt"(i64 %t118, i64 %t119)
  %t121 = icmp ne i64 %t120, 0
  br i1 %t121, label %then6, label %else6
then6:
  %t122 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.11)
  ret i64 %t122
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t123 = phi i64 [ 0, %else6_end ]
  %t124 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.12)
  %t125 = load i64, ptr %local.cos2.83
  %t126 = call i64 @"sx_f64_sub"(i64 %t124, i64 %t125)
  ret i64 %t126
}

define i64 @"coupling_sq"(i64 %px, i64 %py, i64 %pz, i64 %qx, i64 %qy, i64 %qz, i64 %kx, i64 %ky, i64 %kz, i64 %s) nounwind {
entry:
  %local.q2.127 = alloca i64
  %local.p2.128 = alloca i64
  %local.u_p_sq.129 = alloca i64
  %local.sin2.130 = alloca i64
  %local.px = alloca i64
  store i64 %px, ptr %local.px
  %local.py = alloca i64
  store i64 %py, ptr %local.py
  %local.pz = alloca i64
  store i64 %pz, ptr %local.pz
  %local.qx = alloca i64
  store i64 %qx, ptr %local.qx
  %local.qy = alloca i64
  store i64 %qy, ptr %local.qy
  %local.qz = alloca i64
  store i64 %qz, ptr %local.qz
  %local.kx = alloca i64
  store i64 %kx, ptr %local.kx
  %local.ky = alloca i64
  store i64 %ky, ptr %local.ky
  %local.kz = alloca i64
  store i64 %kz, ptr %local.kz
  %local.s = alloca i64
  store i64 %s, ptr %local.s
  %t131 = load i64, ptr %local.qx
  %t132 = load i64, ptr %local.qy
  %t133 = load i64, ptr %local.qz
  %t134 = call i64 @"ksq"(i64 %t131, i64 %t132, i64 %t133)
  store i64 %t134, ptr %local.q2.127
  %t135 = load i64, ptr %local.px
  %t136 = load i64, ptr %local.py
  %t137 = load i64, ptr %local.pz
  %t138 = call i64 @"ksq"(i64 %t135, i64 %t136, i64 %t137)
  store i64 %t138, ptr %local.p2.128
  %t139 = load i64, ptr %local.p2.128
  %t140 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.13)
  %t141 = call i64 @"sx_f64_lt"(i64 %t139, i64 %t140)
  %t142 = icmp ne i64 %t141, 0
  br i1 %t142, label %then7, label %else7
then7:
  %t143 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.14)
  ret i64 %t143
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t144 = phi i64 [ 0, %else7_end ]
  %t145 = load i64, ptr %local.q2.127
  %t146 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.15)
  %t147 = call i64 @"sx_f64_lt"(i64 %t145, i64 %t146)
  %t148 = icmp ne i64 %t147, 0
  br i1 %t148, label %then8, label %else8
then8:
  %t149 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.16)
  ret i64 %t149
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t150 = phi i64 [ 0, %else8_end ]
  %t151 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.17)
  store i64 %t151, ptr %local.u_p_sq.129
  %t152 = load i64, ptr %local.s
  %t153 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.18)
  %t154 = call i64 @"sx_f64_gt"(i64 %t152, i64 %t153)
  %t155 = icmp ne i64 %t154, 0
  br i1 %t155, label %then9, label %else9
then9:
  %t156 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.19)
  %t157 = load i64, ptr %local.p2.128
  %t158 = load i64, ptr %local.s
  %t159 = call i64 @"sx_f64_to_int"(i64 %t158)
  %t160 = call i64 @"my_pow"(i64 %t157, i64 %t159)
  %t161 = call i64 @"sx_f64_div"(i64 %t156, i64 %t160)
  store i64 %t161, ptr %local.u_p_sq.129
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t162 = phi i64 [ 0, %then9_end ], [ 0, %else9_end ]
  %t163 = load i64, ptr %local.qx
  %t164 = load i64, ptr %local.qy
  %t165 = load i64, ptr %local.qz
  %t166 = load i64, ptr %local.kx
  %t167 = load i64, ptr %local.ky
  %t168 = load i64, ptr %local.kz
  %t169 = call i64 @"sin2_angle"(i64 %t163, i64 %t164, i64 %t165, i64 %t166, i64 %t167, i64 %t168)
  store i64 %t169, ptr %local.sin2.130
  %t170 = load i64, ptr %local.q2.127
  %t171 = load i64, ptr %local.u_p_sq.129
  %t172 = call i64 @"sx_f64_mul"(i64 %t170, i64 %t171)
  %t173 = load i64, ptr %local.sin2.130
  %t174 = call i64 @"sx_f64_mul"(i64 %t172, i64 %t173)
  ret i64 %t174
}

define i64 @"sum_coupling_for_k"(i64 %kx, i64 %ky, i64 %kz, i64 %n_max, i64 %s) nounwind {
entry:
  %local.total.175 = alloca i64
  %local.count.176 = alloca i64
  %local.px.177 = alloca i64
  %local.py.178 = alloca i64
  %local.pz.179 = alloca i64
  %local.p2.180 = alloca i64
  %local.qx.181 = alloca i64
  %local.qy.182 = alloca i64
  %local.qz.183 = alloca i64
  %local.q2.184 = alloca i64
  %local.n_max_f.185 = alloca i64
  %local.c2.186 = alloca i64
  %local.kx = alloca i64
  store i64 %kx, ptr %local.kx
  %local.ky = alloca i64
  store i64 %ky, ptr %local.ky
  %local.kz = alloca i64
  store i64 %kz, ptr %local.kz
  %local.n_max = alloca i64
  store i64 %n_max, ptr %local.n_max
  %local.s = alloca i64
  store i64 %s, ptr %local.s
  %t187 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.20)
  store i64 %t187, ptr %local.total.175
  store i64 0, ptr %local.count.176
  %t188 = load i64, ptr %local.n_max
  %t189 = sub i64 0, %t188
  store i64 %t189, ptr %local.px.177
  br label %loop10
loop10:
  %t190 = load i64, ptr %local.px.177
  %t191 = load i64, ptr %local.n_max
  %t192 = icmp sle i64 %t190, %t191
  %t193 = zext i1 %t192 to i64
  %t194 = icmp ne i64 %t193, 0
  br i1 %t194, label %body10, label %endloop10
body10:
  %t195 = load i64, ptr %local.n_max
  %t196 = sub i64 0, %t195
  store i64 %t196, ptr %local.py.178
  br label %loop11
loop11:
  %t197 = load i64, ptr %local.py.178
  %t198 = load i64, ptr %local.n_max
  %t199 = icmp sle i64 %t197, %t198
  %t200 = zext i1 %t199 to i64
  %t201 = icmp ne i64 %t200, 0
  br i1 %t201, label %body11, label %endloop11
body11:
  %t202 = load i64, ptr %local.n_max
  %t203 = sub i64 0, %t202
  store i64 %t203, ptr %local.pz.179
  br label %loop12
loop12:
  %t204 = load i64, ptr %local.pz.179
  %t205 = load i64, ptr %local.n_max
  %t206 = icmp sle i64 %t204, %t205
  %t207 = zext i1 %t206 to i64
  %t208 = icmp ne i64 %t207, 0
  br i1 %t208, label %body12, label %endloop12
body12:
  %t209 = load i64, ptr %local.px.177
  %t210 = load i64, ptr %local.py.178
  %t211 = load i64, ptr %local.pz.179
  %t212 = call i64 @"ksq"(i64 %t209, i64 %t210, i64 %t211)
  store i64 %t212, ptr %local.p2.180
  %t213 = load i64, ptr %local.p2.180
  %t214 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.21)
  %t215 = call i64 @"sx_f64_gt"(i64 %t213, i64 %t214)
  %t216 = icmp ne i64 %t215, 0
  br i1 %t216, label %then13, label %else13
then13:
  %t217 = load i64, ptr %local.kx
  %t218 = load i64, ptr %local.px.177
  %t219 = sub i64 %t217, %t218
  store i64 %t219, ptr %local.qx.181
  %t220 = load i64, ptr %local.ky
  %t221 = load i64, ptr %local.py.178
  %t222 = sub i64 %t220, %t221
  store i64 %t222, ptr %local.qy.182
  %t223 = load i64, ptr %local.kz
  %t224 = load i64, ptr %local.pz.179
  %t225 = sub i64 %t223, %t224
  store i64 %t225, ptr %local.qz.183
  %t226 = load i64, ptr %local.qx.181
  %t227 = load i64, ptr %local.qy.182
  %t228 = load i64, ptr %local.qz.183
  %t229 = call i64 @"ksq"(i64 %t226, i64 %t227, i64 %t228)
  store i64 %t229, ptr %local.q2.184
  %t230 = load i64, ptr %local.n_max
  %t231 = call i64 @"sx_int_to_f64"(i64 %t230)
  store i64 %t231, ptr %local.n_max_f.185
  %t232 = load i64, ptr %local.q2.184
  %t233 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.22)
  %t234 = call i64 @"sx_f64_gt"(i64 %t232, i64 %t233)
  %t235 = icmp ne i64 %t234, 0
  br i1 %t235, label %then14, label %else14
then14:
  %t236 = load i64, ptr %local.q2.184
  %t237 = load i64, ptr %local.n_max_f.185
  %t238 = load i64, ptr %local.n_max_f.185
  %t239 = call i64 @"sx_f64_mul"(i64 %t237, i64 %t238)
  %t240 = call i64 @"sx_f64_le"(i64 %t236, i64 %t239)
  %t241 = icmp ne i64 %t240, 0
  br i1 %t241, label %then15, label %else15
then15:
  %t242 = load i64, ptr %local.px.177
  %t243 = load i64, ptr %local.py.178
  %t244 = load i64, ptr %local.pz.179
  %t245 = load i64, ptr %local.qx.181
  %t246 = load i64, ptr %local.qy.182
  %t247 = load i64, ptr %local.qz.183
  %t248 = load i64, ptr %local.kx
  %t249 = load i64, ptr %local.ky
  %t250 = load i64, ptr %local.kz
  %t251 = load i64, ptr %local.s
  %t252 = call i64 @"coupling_sq"(i64 %t242, i64 %t243, i64 %t244, i64 %t245, i64 %t246, i64 %t247, i64 %t248, i64 %t249, i64 %t250, i64 %t251)
  store i64 %t252, ptr %local.c2.186
  %t253 = load i64, ptr %local.total.175
  %t254 = load i64, ptr %local.c2.186
  %t255 = call i64 @"sx_f64_add"(i64 %t253, i64 %t254)
  store i64 %t255, ptr %local.total.175
  %t256 = load i64, ptr %local.count.176
  %t257 = add i64 %t256, 1
  store i64 %t257, ptr %local.count.176
  br label %then15_end
then15_end:
  br label %endif15
else15:
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t258 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t259 = phi i64 [ %t258, %then14_end ], [ 0, %else14_end ]
  br label %then13_end
then13_end:
  br label %endif13
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t260 = phi i64 [ %t259, %then13_end ], [ 0, %else13_end ]
  %t261 = load i64, ptr %local.pz.179
  %t262 = add i64 %t261, 1
  store i64 %t262, ptr %local.pz.179
  br label %loop12
endloop12:
  %t263 = load i64, ptr %local.py.178
  %t264 = add i64 %t263, 1
  store i64 %t264, ptr %local.py.178
  br label %loop11
endloop11:
  %t265 = load i64, ptr %local.px.177
  %t266 = add i64 %t265, 1
  store i64 %t266, ptr %local.px.177
  br label %loop10
endloop10:
  %t267 = load i64, ptr %local.total.175
  ret i64 %t267
}

define i64 @"count_triads_for_k"(i64 %kx, i64 %ky, i64 %kz, i64 %n_max) nounwind {
entry:
  %local.count.268 = alloca i64
  %local.px.269 = alloca i64
  %local.py.270 = alloca i64
  %local.pz.271 = alloca i64
  %local.p2.272 = alloca i64
  %local.qx.273 = alloca i64
  %local.qy.274 = alloca i64
  %local.qz.275 = alloca i64
  %local.q2.276 = alloca i64
  %local.n_max_f.277 = alloca i64
  %local.kx = alloca i64
  store i64 %kx, ptr %local.kx
  %local.ky = alloca i64
  store i64 %ky, ptr %local.ky
  %local.kz = alloca i64
  store i64 %kz, ptr %local.kz
  %local.n_max = alloca i64
  store i64 %n_max, ptr %local.n_max
  store i64 0, ptr %local.count.268
  %t278 = load i64, ptr %local.n_max
  %t279 = sub i64 0, %t278
  store i64 %t279, ptr %local.px.269
  br label %loop16
loop16:
  %t280 = load i64, ptr %local.px.269
  %t281 = load i64, ptr %local.n_max
  %t282 = icmp sle i64 %t280, %t281
  %t283 = zext i1 %t282 to i64
  %t284 = icmp ne i64 %t283, 0
  br i1 %t284, label %body16, label %endloop16
body16:
  %t285 = load i64, ptr %local.n_max
  %t286 = sub i64 0, %t285
  store i64 %t286, ptr %local.py.270
  br label %loop17
loop17:
  %t287 = load i64, ptr %local.py.270
  %t288 = load i64, ptr %local.n_max
  %t289 = icmp sle i64 %t287, %t288
  %t290 = zext i1 %t289 to i64
  %t291 = icmp ne i64 %t290, 0
  br i1 %t291, label %body17, label %endloop17
body17:
  %t292 = load i64, ptr %local.n_max
  %t293 = sub i64 0, %t292
  store i64 %t293, ptr %local.pz.271
  br label %loop18
loop18:
  %t294 = load i64, ptr %local.pz.271
  %t295 = load i64, ptr %local.n_max
  %t296 = icmp sle i64 %t294, %t295
  %t297 = zext i1 %t296 to i64
  %t298 = icmp ne i64 %t297, 0
  br i1 %t298, label %body18, label %endloop18
body18:
  %t299 = load i64, ptr %local.px.269
  %t300 = load i64, ptr %local.py.270
  %t301 = load i64, ptr %local.pz.271
  %t302 = call i64 @"ksq"(i64 %t299, i64 %t300, i64 %t301)
  store i64 %t302, ptr %local.p2.272
  %t303 = load i64, ptr %local.p2.272
  %t304 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.23)
  %t305 = call i64 @"sx_f64_gt"(i64 %t303, i64 %t304)
  %t306 = icmp ne i64 %t305, 0
  br i1 %t306, label %then19, label %else19
then19:
  %t307 = load i64, ptr %local.kx
  %t308 = load i64, ptr %local.px.269
  %t309 = sub i64 %t307, %t308
  store i64 %t309, ptr %local.qx.273
  %t310 = load i64, ptr %local.ky
  %t311 = load i64, ptr %local.py.270
  %t312 = sub i64 %t310, %t311
  store i64 %t312, ptr %local.qy.274
  %t313 = load i64, ptr %local.kz
  %t314 = load i64, ptr %local.pz.271
  %t315 = sub i64 %t313, %t314
  store i64 %t315, ptr %local.qz.275
  %t316 = load i64, ptr %local.qx.273
  %t317 = load i64, ptr %local.qy.274
  %t318 = load i64, ptr %local.qz.275
  %t319 = call i64 @"ksq"(i64 %t316, i64 %t317, i64 %t318)
  store i64 %t319, ptr %local.q2.276
  %t320 = load i64, ptr %local.n_max
  %t321 = call i64 @"sx_int_to_f64"(i64 %t320)
  store i64 %t321, ptr %local.n_max_f.277
  %t322 = load i64, ptr %local.q2.276
  %t323 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.24)
  %t324 = call i64 @"sx_f64_gt"(i64 %t322, i64 %t323)
  %t325 = icmp ne i64 %t324, 0
  br i1 %t325, label %then20, label %else20
then20:
  %t326 = load i64, ptr %local.q2.276
  %t327 = load i64, ptr %local.n_max_f.277
  %t328 = load i64, ptr %local.n_max_f.277
  %t329 = call i64 @"sx_f64_mul"(i64 %t327, i64 %t328)
  %t330 = call i64 @"sx_f64_le"(i64 %t326, i64 %t329)
  %t331 = icmp ne i64 %t330, 0
  br i1 %t331, label %then21, label %else21
then21:
  %t332 = load i64, ptr %local.count.268
  %t333 = add i64 %t332, 1
  store i64 %t333, ptr %local.count.268
  br label %then21_end
then21_end:
  br label %endif21
else21:
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t334 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t335 = phi i64 [ %t334, %then20_end ], [ 0, %else20_end ]
  br label %then19_end
then19_end:
  br label %endif19
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t336 = phi i64 [ %t335, %then19_end ], [ 0, %else19_end ]
  %t337 = load i64, ptr %local.pz.271
  %t338 = add i64 %t337, 1
  store i64 %t338, ptr %local.pz.271
  br label %loop18
endloop18:
  %t339 = load i64, ptr %local.py.270
  %t340 = add i64 %t339, 1
  store i64 %t340, ptr %local.py.270
  br label %loop17
endloop17:
  %t341 = load i64, ptr %local.px.269
  %t342 = add i64 %t341, 1
  store i64 %t342, ptr %local.px.269
  br label %loop16
endloop16:
  %t343 = load i64, ptr %local.count.268
  ret i64 %t343
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.nu.344 = alloca i64
  %local.n_test.345 = alloca i64
  %local.k_mag.346 = alloca i64
  %local.r_vals_1.347 = alloca i64
  %local.r_vals_2.348 = alloca i64
  %local.r_vals_3.349 = alloca i64
  %local.r_vals_4.350 = alloca i64
  %local.r_vals_5.351 = alloca i64
  %local.r_vals_6.352 = alloca i64
  %local.r_vals_7.353 = alloca i64
  %local.r_vals_8.354 = alloca i64
  %local.s_stretch.355 = alloca i64
  %local.k_f.356 = alloca i64
  %local.k4.357 = alloca i64
  %local.s_diffuse.358 = alloca i64
  %local.ratio.359 = alloca i64
  %local.n_triads.360 = alloca i64
  %local.log_ratio.361 = alloca i64
  %local.ratio_12.362 = alloca i64
  %local.ratio_24.363 = alloca i64
  %local.ratio_48.364 = alloca i64
  %local.r_h1_1.365 = alloca i64
  %local.r_h1_2.366 = alloca i64
  %local.r_h1_4.367 = alloca i64
  %local.r_h1_8.368 = alloca i64
  %local.s_stretch.369 = alloca i64
  %local.k_f.370 = alloca i64
  %local.k4.371 = alloca i64
  %local.s_diffuse.372 = alloca i64
  %local.ratio.373 = alloca i64
  %local.n_triads.374 = alloca i64
  %local.with_leray.375 = alloca i64
  %local.without_leray.376 = alloca i64
  %local.px.377 = alloca i64
  %local.py.378 = alloca i64
  %local.pz.379 = alloca i64
  %local.p2.380 = alloca i64
  %local.qx.381 = alloca i64
  %local.qy.382 = alloca i64
  %local.qz.383 = alloca i64
  %local.q2.384 = alloca i64
  %local.nf.385 = alloca i64
  %local.reduction.386 = alloca i64
  %local.n_val.387 = alloca i64
  %local.s_str.388 = alloca i64
  %local.s_dif.389 = alloca i64
  %local.ratio.390 = alloca i64
  %t391 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.25)
  store i64 %t391, ptr %local.nu.344
  %t392 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.26)
  %t393 = ptrtoint ptr %t392 to i64
  %t394 = inttoptr i64 %t393 to ptr
  call void @intrinsic_println(ptr %t394)
  %t395 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.27)
  %t396 = ptrtoint ptr %t395 to i64
  %t397 = inttoptr i64 %t396 to ptr
  call void @intrinsic_println(ptr %t397)
  %t398 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.28)
  %t399 = ptrtoint ptr %t398 to i64
  %t400 = inttoptr i64 %t399 to ptr
  call void @intrinsic_println(ptr %t400)
  %t401 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.29)
  %t402 = ptrtoint ptr %t401 to i64
  %t403 = inttoptr i64 %t402 to ptr
  call void @intrinsic_println(ptr %t403)
  %t404 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.30)
  %t405 = ptrtoint ptr %t404 to i64
  %t406 = inttoptr i64 %t405 to ptr
  call void @intrinsic_println(ptr %t406)
  %t407 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.31)
  %t408 = ptrtoint ptr %t407 to i64
  %t409 = inttoptr i64 %t408 to ptr
  call void @intrinsic_println(ptr %t409)
  %t410 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.32)
  %t411 = ptrtoint ptr %t410 to i64
  %t412 = inttoptr i64 %t411 to ptr
  call void @intrinsic_println(ptr %t412)
  %t413 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.33)
  %t414 = ptrtoint ptr %t413 to i64
  %t415 = inttoptr i64 %t414 to ptr
  call void @intrinsic_println(ptr %t415)
  %t416 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.34)
  %t417 = ptrtoint ptr %t416 to i64
  %t418 = inttoptr i64 %t417 to ptr
  call void @intrinsic_println(ptr %t418)
  %t419 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.35)
  %t420 = ptrtoint ptr %t419 to i64
  %t421 = inttoptr i64 %t420 to ptr
  call void @intrinsic_println(ptr %t421)
  %t422 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.36)
  %t423 = ptrtoint ptr %t422 to i64
  %t424 = inttoptr i64 %t423 to ptr
  call void @intrinsic_println(ptr %t424)
  %t425 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.37)
  %t426 = ptrtoint ptr %t425 to i64
  %t427 = inttoptr i64 %t426 to ptr
  call void @intrinsic_println(ptr %t427)
  %t428 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.38)
  %t429 = ptrtoint ptr %t428 to i64
  %t430 = inttoptr i64 %t429 to ptr
  call void @intrinsic_println(ptr %t430)
  %t431 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.39)
  %t432 = ptrtoint ptr %t431 to i64
  %t433 = inttoptr i64 %t432 to ptr
  call void @intrinsic_println(ptr %t433)
  %t434 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.40)
  %t435 = ptrtoint ptr %t434 to i64
  %t436 = inttoptr i64 %t435 to ptr
  call void @intrinsic_println(ptr %t436)
  %t437 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.41)
  %t438 = ptrtoint ptr %t437 to i64
  %t439 = inttoptr i64 %t438 to ptr
  call void @intrinsic_println(ptr %t439)
  %t440 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.42)
  %t441 = ptrtoint ptr %t440 to i64
  %t442 = inttoptr i64 %t441 to ptr
  call void @intrinsic_println(ptr %t442)
  store i64 8, ptr %local.n_test.345
  store i64 1, ptr %local.k_mag.346
  %t443 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.43)
  store i64 %t443, ptr %local.r_vals_1.347
  %t444 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.44)
  store i64 %t444, ptr %local.r_vals_2.348
  %t445 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.45)
  store i64 %t445, ptr %local.r_vals_3.349
  %t446 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.46)
  store i64 %t446, ptr %local.r_vals_4.350
  %t447 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.47)
  store i64 %t447, ptr %local.r_vals_5.351
  %t448 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.48)
  store i64 %t448, ptr %local.r_vals_6.352
  %t449 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.49)
  store i64 %t449, ptr %local.r_vals_7.353
  %t450 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.50)
  store i64 %t450, ptr %local.r_vals_8.354
  br label %loop22
loop22:
  %t451 = load i64, ptr %local.k_mag.346
  %t452 = icmp sle i64 %t451, 8
  %t453 = zext i1 %t452 to i64
  %t454 = icmp ne i64 %t453, 0
  br i1 %t454, label %body22, label %endloop22
body22:
  %t455 = load i64, ptr %local.k_mag.346
  %t456 = load i64, ptr %local.n_test.345
  %t457 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.51)
  %t458 = call i64 @"sum_coupling_for_k"(i64 %t455, i64 0, i64 0, i64 %t456, i64 %t457)
  store i64 %t458, ptr %local.s_stretch.355
  %t459 = load i64, ptr %local.k_mag.346
  %t460 = call i64 @"sx_int_to_f64"(i64 %t459)
  store i64 %t460, ptr %local.k_f.356
  %t461 = load i64, ptr %local.k_f.356
  %t462 = load i64, ptr %local.k_f.356
  %t463 = call i64 @"sx_f64_mul"(i64 %t461, i64 %t462)
  %t464 = load i64, ptr %local.k_f.356
  %t465 = call i64 @"sx_f64_mul"(i64 %t463, i64 %t464)
  %t466 = load i64, ptr %local.k_f.356
  %t467 = call i64 @"sx_f64_mul"(i64 %t465, i64 %t466)
  store i64 %t467, ptr %local.k4.357
  %t468 = load i64, ptr %local.nu.344
  %t469 = load i64, ptr %local.nu.344
  %t470 = call i64 @"sx_f64_mul"(i64 %t468, i64 %t469)
  %t471 = load i64, ptr %local.k4.357
  %t472 = call i64 @"sx_f64_mul"(i64 %t470, i64 %t471)
  store i64 %t472, ptr %local.s_diffuse.358
  %t473 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.52)
  store i64 %t473, ptr %local.ratio.359
  %t474 = load i64, ptr %local.s_diffuse.358
  %t475 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.53)
  %t476 = call i64 @"sx_f64_gt"(i64 %t474, i64 %t475)
  %t477 = icmp ne i64 %t476, 0
  br i1 %t477, label %then23, label %else23
then23:
  %t478 = load i64, ptr %local.s_stretch.355
  %t479 = load i64, ptr %local.s_diffuse.358
  %t480 = call i64 @"sx_f64_div"(i64 %t478, i64 %t479)
  store i64 %t480, ptr %local.ratio.359
  br label %then23_end
then23_end:
  br label %endif23
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t481 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  %t482 = load i64, ptr %local.k_mag.346
  %t483 = load i64, ptr %local.n_test.345
  %t484 = call i64 @"count_triads_for_k"(i64 %t482, i64 0, i64 0, i64 %t483)
  store i64 %t484, ptr %local.n_triads.360
  %t485 = load i64, ptr %local.k_mag.346
  %t486 = icmp eq i64 %t485, 1
  %t487 = zext i1 %t486 to i64
  %t488 = icmp ne i64 %t487, 0
  br i1 %t488, label %then24, label %else24
then24:
  %t489 = load i64, ptr %local.ratio.359
  store i64 %t489, ptr %local.r_vals_1.347
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t490 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t491 = load i64, ptr %local.k_mag.346
  %t492 = icmp eq i64 %t491, 2
  %t493 = zext i1 %t492 to i64
  %t494 = icmp ne i64 %t493, 0
  br i1 %t494, label %then25, label %else25
then25:
  %t495 = load i64, ptr %local.ratio.359
  store i64 %t495, ptr %local.r_vals_2.348
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t496 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t497 = load i64, ptr %local.k_mag.346
  %t498 = icmp eq i64 %t497, 3
  %t499 = zext i1 %t498 to i64
  %t500 = icmp ne i64 %t499, 0
  br i1 %t500, label %then26, label %else26
then26:
  %t501 = load i64, ptr %local.ratio.359
  store i64 %t501, ptr %local.r_vals_3.349
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t502 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t503 = load i64, ptr %local.k_mag.346
  %t504 = icmp eq i64 %t503, 4
  %t505 = zext i1 %t504 to i64
  %t506 = icmp ne i64 %t505, 0
  br i1 %t506, label %then27, label %else27
then27:
  %t507 = load i64, ptr %local.ratio.359
  store i64 %t507, ptr %local.r_vals_4.350
  br label %then27_end
then27_end:
  br label %endif27
else27:
  br label %else27_end
else27_end:
  br label %endif27
endif27:
  %t508 = phi i64 [ 0, %then27_end ], [ 0, %else27_end ]
  %t509 = load i64, ptr %local.k_mag.346
  %t510 = icmp eq i64 %t509, 5
  %t511 = zext i1 %t510 to i64
  %t512 = icmp ne i64 %t511, 0
  br i1 %t512, label %then28, label %else28
then28:
  %t513 = load i64, ptr %local.ratio.359
  store i64 %t513, ptr %local.r_vals_5.351
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t514 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t515 = load i64, ptr %local.k_mag.346
  %t516 = icmp eq i64 %t515, 6
  %t517 = zext i1 %t516 to i64
  %t518 = icmp ne i64 %t517, 0
  br i1 %t518, label %then29, label %else29
then29:
  %t519 = load i64, ptr %local.ratio.359
  store i64 %t519, ptr %local.r_vals_6.352
  br label %then29_end
then29_end:
  br label %endif29
else29:
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t520 = phi i64 [ 0, %then29_end ], [ 0, %else29_end ]
  %t521 = load i64, ptr %local.k_mag.346
  %t522 = icmp eq i64 %t521, 7
  %t523 = zext i1 %t522 to i64
  %t524 = icmp ne i64 %t523, 0
  br i1 %t524, label %then30, label %else30
then30:
  %t525 = load i64, ptr %local.ratio.359
  store i64 %t525, ptr %local.r_vals_7.353
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t526 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t527 = load i64, ptr %local.k_mag.346
  %t528 = icmp eq i64 %t527, 8
  %t529 = zext i1 %t528 to i64
  %t530 = icmp ne i64 %t529, 0
  br i1 %t530, label %then31, label %else31
then31:
  %t531 = load i64, ptr %local.ratio.359
  store i64 %t531, ptr %local.r_vals_8.354
  br label %then31_end
then31_end:
  br label %endif31
else31:
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t532 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t533 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.54)
  %t534 = ptrtoint ptr %t533 to i64
  %t535 = inttoptr i64 %t534 to ptr
  call void @intrinsic_print(ptr %t535)
  %t536 = load i64, ptr %local.k_mag.346
  call void @print_i64(i64 %t536)
  %t537 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.55)
  %t538 = ptrtoint ptr %t537 to i64
  %t539 = inttoptr i64 %t538 to ptr
  call void @intrinsic_print(ptr %t539)
  %t540 = load i64, ptr %local.s_stretch.355
  %t541 = call i64 @"print_f64"(i64 %t540)
  %t542 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.56)
  %t543 = ptrtoint ptr %t542 to i64
  %t544 = inttoptr i64 %t543 to ptr
  call void @intrinsic_print(ptr %t544)
  %t545 = load i64, ptr %local.s_diffuse.358
  %t546 = call i64 @"print_f64"(i64 %t545)
  %t547 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.57)
  %t548 = ptrtoint ptr %t547 to i64
  %t549 = inttoptr i64 %t548 to ptr
  call void @intrinsic_print(ptr %t549)
  %t550 = load i64, ptr %local.ratio.359
  %t551 = call i64 @"print_f64"(i64 %t550)
  %t552 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.58)
  %t553 = ptrtoint ptr %t552 to i64
  %t554 = inttoptr i64 %t553 to ptr
  call void @intrinsic_print(ptr %t554)
  %t555 = load i64, ptr %local.n_triads.360
  call void @print_i64(i64 %t555)
  %t556 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.59)
  %t557 = ptrtoint ptr %t556 to i64
  %t558 = inttoptr i64 %t557 to ptr
  call void @intrinsic_println(ptr %t558)
  %t559 = load i64, ptr %local.k_mag.346
  %t560 = add i64 %t559, 1
  store i64 %t560, ptr %local.k_mag.346
  br label %loop22
endloop22:
  %t561 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.60)
  %t562 = ptrtoint ptr %t561 to i64
  %t563 = inttoptr i64 %t562 to ptr
  call void @intrinsic_println(ptr %t563)
  %t564 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.61)
  %t565 = ptrtoint ptr %t564 to i64
  %t566 = inttoptr i64 %t565 to ptr
  call void @intrinsic_println(ptr %t566)
  %t567 = load i64, ptr %local.r_vals_1.347
  %t568 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.62)
  %t569 = call i64 @"sx_f64_gt"(i64 %t567, i64 %t568)
  %t570 = icmp ne i64 %t569, 0
  br i1 %t570, label %then32, label %else32
then32:
  %t571 = load i64, ptr %local.r_vals_8.354
  %t572 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.63)
  %t573 = call i64 @"sx_f64_gt"(i64 %t571, i64 %t572)
  %t574 = icmp ne i64 %t573, 0
  br i1 %t574, label %then33, label %else33
then33:
  %t575 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.64)
  store i64 %t575, ptr %local.log_ratio.361
  %t576 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.65)
  %t577 = ptrtoint ptr %t576 to i64
  %t578 = inttoptr i64 %t577 to ptr
  call void @intrinsic_print(ptr %t578)
  %t579 = load i64, ptr %local.r_vals_1.347
  %t580 = call i64 @"print_f64"(i64 %t579)
  %t581 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.66)
  %t582 = ptrtoint ptr %t581 to i64
  %t583 = inttoptr i64 %t582 to ptr
  call void @intrinsic_println(ptr %t583)
  %t584 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.67)
  %t585 = ptrtoint ptr %t584 to i64
  %t586 = inttoptr i64 %t585 to ptr
  call void @intrinsic_print(ptr %t586)
  %t587 = load i64, ptr %local.r_vals_2.348
  %t588 = call i64 @"print_f64"(i64 %t587)
  %t589 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.68)
  %t590 = ptrtoint ptr %t589 to i64
  %t591 = inttoptr i64 %t590 to ptr
  call void @intrinsic_println(ptr %t591)
  %t592 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.69)
  %t593 = ptrtoint ptr %t592 to i64
  %t594 = inttoptr i64 %t593 to ptr
  call void @intrinsic_print(ptr %t594)
  %t595 = load i64, ptr %local.r_vals_4.350
  %t596 = call i64 @"print_f64"(i64 %t595)
  %t597 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.70)
  %t598 = ptrtoint ptr %t597 to i64
  %t599 = inttoptr i64 %t598 to ptr
  call void @intrinsic_println(ptr %t599)
  %t600 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.71)
  %t601 = ptrtoint ptr %t600 to i64
  %t602 = inttoptr i64 %t601 to ptr
  call void @intrinsic_print(ptr %t602)
  %t603 = load i64, ptr %local.r_vals_8.354
  %t604 = call i64 @"print_f64"(i64 %t603)
  %t605 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.72)
  %t606 = ptrtoint ptr %t605 to i64
  %t607 = inttoptr i64 %t606 to ptr
  call void @intrinsic_println(ptr %t607)
  %t608 = load i64, ptr %local.r_vals_2.348
  %t609 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.73)
  %t610 = call i64 @"sx_f64_gt"(i64 %t608, i64 %t609)
  %t611 = icmp ne i64 %t610, 0
  br i1 %t611, label %then34, label %else34
then34:
  %t612 = load i64, ptr %local.r_vals_2.348
  %t613 = load i64, ptr %local.r_vals_1.347
  %t614 = call i64 @"sx_f64_div"(i64 %t612, i64 %t613)
  store i64 %t614, ptr %local.ratio_12.362
  %t615 = load i64, ptr %local.r_vals_4.350
  %t616 = load i64, ptr %local.r_vals_2.348
  %t617 = call i64 @"sx_f64_div"(i64 %t615, i64 %t616)
  store i64 %t617, ptr %local.ratio_24.363
  %t618 = load i64, ptr %local.r_vals_8.354
  %t619 = load i64, ptr %local.r_vals_4.350
  %t620 = call i64 @"sx_f64_div"(i64 %t618, i64 %t619)
  store i64 %t620, ptr %local.ratio_48.364
  %t621 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.74)
  %t622 = ptrtoint ptr %t621 to i64
  %t623 = inttoptr i64 %t622 to ptr
  call void @intrinsic_print(ptr %t623)
  %t624 = load i64, ptr %local.ratio_12.362
  %t625 = call i64 @"print_f64"(i64 %t624)
  %t626 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.75)
  %t627 = ptrtoint ptr %t626 to i64
  %t628 = inttoptr i64 %t627 to ptr
  call void @intrinsic_println(ptr %t628)
  %t629 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.76)
  %t630 = ptrtoint ptr %t629 to i64
  %t631 = inttoptr i64 %t630 to ptr
  call void @intrinsic_print(ptr %t631)
  %t632 = load i64, ptr %local.ratio_24.363
  %t633 = call i64 @"print_f64"(i64 %t632)
  %t634 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.77)
  %t635 = ptrtoint ptr %t634 to i64
  %t636 = inttoptr i64 %t635 to ptr
  call void @intrinsic_println(ptr %t636)
  %t637 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.78)
  %t638 = ptrtoint ptr %t637 to i64
  %t639 = inttoptr i64 %t638 to ptr
  call void @intrinsic_print(ptr %t639)
  %t640 = load i64, ptr %local.ratio_48.364
  %t641 = call i64 @"print_f64"(i64 %t640)
  %t642 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.79)
  %t643 = ptrtoint ptr %t642 to i64
  %t644 = inttoptr i64 %t643 to ptr
  call void @intrinsic_println(ptr %t644)
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t645 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  br label %then33_end
then33_end:
  br label %endif33
else33:
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t646 = phi i64 [ %t645, %then33_end ], [ 0, %else33_end ]
  br label %then32_end
then32_end:
  br label %endif32
else32:
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t647 = phi i64 [ %t646, %then32_end ], [ 0, %else32_end ]
  %t648 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.80)
  %t649 = ptrtoint ptr %t648 to i64
  %t650 = inttoptr i64 %t649 to ptr
  call void @intrinsic_println(ptr %t650)
  %t651 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.81)
  %t652 = ptrtoint ptr %t651 to i64
  %t653 = inttoptr i64 %t652 to ptr
  call void @intrinsic_println(ptr %t653)
  %t654 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.82)
  %t655 = ptrtoint ptr %t654 to i64
  %t656 = inttoptr i64 %t655 to ptr
  call void @intrinsic_println(ptr %t656)
  %t657 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.83)
  %t658 = ptrtoint ptr %t657 to i64
  %t659 = inttoptr i64 %t658 to ptr
  call void @intrinsic_println(ptr %t659)
  %t660 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.84)
  %t661 = ptrtoint ptr %t660 to i64
  %t662 = inttoptr i64 %t661 to ptr
  call void @intrinsic_println(ptr %t662)
  store i64 1, ptr %local.k_mag.346
  %t663 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.85)
  store i64 %t663, ptr %local.r_h1_1.365
  %t664 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.86)
  store i64 %t664, ptr %local.r_h1_2.366
  %t665 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.87)
  store i64 %t665, ptr %local.r_h1_4.367
  %t666 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.88)
  store i64 %t666, ptr %local.r_h1_8.368
  br label %loop35
loop35:
  %t667 = load i64, ptr %local.k_mag.346
  %t668 = icmp sle i64 %t667, 8
  %t669 = zext i1 %t668 to i64
  %t670 = icmp ne i64 %t669, 0
  br i1 %t670, label %body35, label %endloop35
body35:
  %t671 = load i64, ptr %local.k_mag.346
  %t672 = load i64, ptr %local.n_test.345
  %t673 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.89)
  %t674 = call i64 @"sum_coupling_for_k"(i64 %t671, i64 0, i64 0, i64 %t672, i64 %t673)
  store i64 %t674, ptr %local.s_stretch.369
  %t675 = load i64, ptr %local.k_mag.346
  %t676 = call i64 @"sx_int_to_f64"(i64 %t675)
  store i64 %t676, ptr %local.k_f.370
  %t677 = load i64, ptr %local.k_f.370
  %t678 = load i64, ptr %local.k_f.370
  %t679 = call i64 @"sx_f64_mul"(i64 %t677, i64 %t678)
  %t680 = load i64, ptr %local.k_f.370
  %t681 = call i64 @"sx_f64_mul"(i64 %t679, i64 %t680)
  %t682 = load i64, ptr %local.k_f.370
  %t683 = call i64 @"sx_f64_mul"(i64 %t681, i64 %t682)
  store i64 %t683, ptr %local.k4.371
  %t684 = load i64, ptr %local.nu.344
  %t685 = load i64, ptr %local.nu.344
  %t686 = call i64 @"sx_f64_mul"(i64 %t684, i64 %t685)
  %t687 = load i64, ptr %local.k4.371
  %t688 = call i64 @"sx_f64_mul"(i64 %t686, i64 %t687)
  store i64 %t688, ptr %local.s_diffuse.372
  %t689 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.90)
  store i64 %t689, ptr %local.ratio.373
  %t690 = load i64, ptr %local.s_diffuse.372
  %t691 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.91)
  %t692 = call i64 @"sx_f64_gt"(i64 %t690, i64 %t691)
  %t693 = icmp ne i64 %t692, 0
  br i1 %t693, label %then36, label %else36
then36:
  %t694 = load i64, ptr %local.s_stretch.369
  %t695 = load i64, ptr %local.s_diffuse.372
  %t696 = call i64 @"sx_f64_div"(i64 %t694, i64 %t695)
  store i64 %t696, ptr %local.ratio.373
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t697 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t698 = load i64, ptr %local.k_mag.346
  %t699 = load i64, ptr %local.n_test.345
  %t700 = call i64 @"count_triads_for_k"(i64 %t698, i64 0, i64 0, i64 %t699)
  store i64 %t700, ptr %local.n_triads.374
  %t701 = load i64, ptr %local.k_mag.346
  %t702 = icmp eq i64 %t701, 1
  %t703 = zext i1 %t702 to i64
  %t704 = icmp ne i64 %t703, 0
  br i1 %t704, label %then37, label %else37
then37:
  %t705 = load i64, ptr %local.ratio.373
  store i64 %t705, ptr %local.r_h1_1.365
  br label %then37_end
then37_end:
  br label %endif37
else37:
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t706 = phi i64 [ 0, %then37_end ], [ 0, %else37_end ]
  %t707 = load i64, ptr %local.k_mag.346
  %t708 = icmp eq i64 %t707, 2
  %t709 = zext i1 %t708 to i64
  %t710 = icmp ne i64 %t709, 0
  br i1 %t710, label %then38, label %else38
then38:
  %t711 = load i64, ptr %local.ratio.373
  store i64 %t711, ptr %local.r_h1_2.366
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t712 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t713 = load i64, ptr %local.k_mag.346
  %t714 = icmp eq i64 %t713, 4
  %t715 = zext i1 %t714 to i64
  %t716 = icmp ne i64 %t715, 0
  br i1 %t716, label %then39, label %else39
then39:
  %t717 = load i64, ptr %local.ratio.373
  store i64 %t717, ptr %local.r_h1_4.367
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t718 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t719 = load i64, ptr %local.k_mag.346
  %t720 = icmp eq i64 %t719, 8
  %t721 = zext i1 %t720 to i64
  %t722 = icmp ne i64 %t721, 0
  br i1 %t722, label %then40, label %else40
then40:
  %t723 = load i64, ptr %local.ratio.373
  store i64 %t723, ptr %local.r_h1_8.368
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t724 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t725 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.92)
  %t726 = ptrtoint ptr %t725 to i64
  %t727 = inttoptr i64 %t726 to ptr
  call void @intrinsic_print(ptr %t727)
  %t728 = load i64, ptr %local.k_mag.346
  call void @print_i64(i64 %t728)
  %t729 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.93)
  %t730 = ptrtoint ptr %t729 to i64
  %t731 = inttoptr i64 %t730 to ptr
  call void @intrinsic_print(ptr %t731)
  %t732 = load i64, ptr %local.s_stretch.369
  %t733 = call i64 @"print_f64"(i64 %t732)
  %t734 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.94)
  %t735 = ptrtoint ptr %t734 to i64
  %t736 = inttoptr i64 %t735 to ptr
  call void @intrinsic_print(ptr %t736)
  %t737 = load i64, ptr %local.s_diffuse.372
  %t738 = call i64 @"print_f64"(i64 %t737)
  %t739 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.95)
  %t740 = ptrtoint ptr %t739 to i64
  %t741 = inttoptr i64 %t740 to ptr
  call void @intrinsic_print(ptr %t741)
  %t742 = load i64, ptr %local.ratio.373
  %t743 = call i64 @"print_f64"(i64 %t742)
  %t744 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.96)
  %t745 = ptrtoint ptr %t744 to i64
  %t746 = inttoptr i64 %t745 to ptr
  call void @intrinsic_print(ptr %t746)
  %t747 = load i64, ptr %local.n_triads.374
  call void @print_i64(i64 %t747)
  %t748 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.97)
  %t749 = ptrtoint ptr %t748 to i64
  %t750 = inttoptr i64 %t749 to ptr
  call void @intrinsic_println(ptr %t750)
  %t751 = load i64, ptr %local.k_mag.346
  %t752 = add i64 %t751, 1
  store i64 %t752, ptr %local.k_mag.346
  br label %loop35
endloop35:
  %t753 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.98)
  %t754 = ptrtoint ptr %t753 to i64
  %t755 = inttoptr i64 %t754 to ptr
  call void @intrinsic_println(ptr %t755)
  %t756 = load i64, ptr %local.r_h1_1.365
  %t757 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.99)
  %t758 = call i64 @"sx_f64_gt"(i64 %t756, i64 %t757)
  %t759 = icmp ne i64 %t758, 0
  br i1 %t759, label %then41, label %else41
then41:
  %t760 = load i64, ptr %local.r_h1_2.366
  %t761 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.100)
  %t762 = call i64 @"sx_f64_gt"(i64 %t760, i64 %t761)
  %t763 = icmp ne i64 %t762, 0
  br i1 %t763, label %then42, label %else42
then42:
  %t764 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.101)
  %t765 = ptrtoint ptr %t764 to i64
  %t766 = inttoptr i64 %t765 to ptr
  call void @intrinsic_print(ptr %t766)
  %t767 = load i64, ptr %local.r_h1_2.366
  %t768 = load i64, ptr %local.r_h1_1.365
  %t769 = call i64 @"sx_f64_div"(i64 %t767, i64 %t768)
  %t770 = call i64 @"print_f64"(i64 %t769)
  %t771 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.102)
  %t772 = ptrtoint ptr %t771 to i64
  %t773 = inttoptr i64 %t772 to ptr
  call void @intrinsic_println(ptr %t773)
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t774 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t775 = load i64, ptr %local.r_h1_4.367
  %t776 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.103)
  %t777 = call i64 @"sx_f64_gt"(i64 %t775, i64 %t776)
  %t778 = icmp ne i64 %t777, 0
  br i1 %t778, label %then43, label %else43
then43:
  %t779 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.104)
  %t780 = ptrtoint ptr %t779 to i64
  %t781 = inttoptr i64 %t780 to ptr
  call void @intrinsic_print(ptr %t781)
  %t782 = load i64, ptr %local.r_h1_4.367
  %t783 = load i64, ptr %local.r_h1_2.366
  %t784 = call i64 @"sx_f64_div"(i64 %t782, i64 %t783)
  %t785 = call i64 @"print_f64"(i64 %t784)
  %t786 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.105)
  %t787 = ptrtoint ptr %t786 to i64
  %t788 = inttoptr i64 %t787 to ptr
  call void @intrinsic_println(ptr %t788)
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t789 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t790 = load i64, ptr %local.r_h1_8.368
  %t791 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.106)
  %t792 = call i64 @"sx_f64_gt"(i64 %t790, i64 %t791)
  %t793 = icmp ne i64 %t792, 0
  br i1 %t793, label %then44, label %else44
then44:
  %t794 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.107)
  %t795 = ptrtoint ptr %t794 to i64
  %t796 = inttoptr i64 %t795 to ptr
  call void @intrinsic_print(ptr %t796)
  %t797 = load i64, ptr %local.r_h1_8.368
  %t798 = load i64, ptr %local.r_h1_4.367
  %t799 = call i64 @"sx_f64_div"(i64 %t797, i64 %t798)
  %t800 = call i64 @"print_f64"(i64 %t799)
  %t801 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.108)
  %t802 = ptrtoint ptr %t801 to i64
  %t803 = inttoptr i64 %t802 to ptr
  call void @intrinsic_println(ptr %t803)
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t804 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t805 = phi i64 [ %t804, %then41_end ], [ 0, %else41_end ]
  %t806 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.109)
  %t807 = ptrtoint ptr %t806 to i64
  %t808 = inttoptr i64 %t807 to ptr
  call void @intrinsic_println(ptr %t808)
  %t809 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.110)
  %t810 = ptrtoint ptr %t809 to i64
  %t811 = inttoptr i64 %t810 to ptr
  call void @intrinsic_println(ptr %t811)
  %t812 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.111)
  %t813 = ptrtoint ptr %t812 to i64
  %t814 = inttoptr i64 %t813 to ptr
  call void @intrinsic_println(ptr %t814)
  %t815 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.112)
  %t816 = ptrtoint ptr %t815 to i64
  %t817 = inttoptr i64 %t816 to ptr
  call void @intrinsic_println(ptr %t817)
  %t818 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.113)
  %t819 = ptrtoint ptr %t818 to i64
  %t820 = inttoptr i64 %t819 to ptr
  call void @intrinsic_println(ptr %t820)
  %t821 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.114)
  %t822 = ptrtoint ptr %t821 to i64
  %t823 = inttoptr i64 %t822 to ptr
  call void @intrinsic_println(ptr %t823)
  %t824 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.115)
  %t825 = ptrtoint ptr %t824 to i64
  %t826 = inttoptr i64 %t825 to ptr
  call void @intrinsic_println(ptr %t826)
  %t827 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.116)
  %t828 = ptrtoint ptr %t827 to i64
  %t829 = inttoptr i64 %t828 to ptr
  call void @intrinsic_println(ptr %t829)
  %t830 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.117)
  %t831 = ptrtoint ptr %t830 to i64
  %t832 = inttoptr i64 %t831 to ptr
  call void @intrinsic_println(ptr %t832)
  store i64 1, ptr %local.k_mag.346
  br label %loop45
loop45:
  %t833 = load i64, ptr %local.k_mag.346
  %t834 = icmp sle i64 %t833, 8
  %t835 = zext i1 %t834 to i64
  %t836 = icmp ne i64 %t835, 0
  br i1 %t836, label %body45, label %endloop45
body45:
  %t837 = load i64, ptr %local.k_mag.346
  %t838 = load i64, ptr %local.n_test.345
  %t839 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.118)
  %t840 = call i64 @"sum_coupling_for_k"(i64 %t837, i64 0, i64 0, i64 %t838, i64 %t839)
  store i64 %t840, ptr %local.with_leray.375
  %t841 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.119)
  store i64 %t841, ptr %local.without_leray.376
  %t842 = load i64, ptr %local.n_test.345
  %t843 = sub i64 0, %t842
  store i64 %t843, ptr %local.px.377
  br label %loop46
loop46:
  %t844 = load i64, ptr %local.px.377
  %t845 = load i64, ptr %local.n_test.345
  %t846 = icmp sle i64 %t844, %t845
  %t847 = zext i1 %t846 to i64
  %t848 = icmp ne i64 %t847, 0
  br i1 %t848, label %body46, label %endloop46
body46:
  %t849 = load i64, ptr %local.n_test.345
  %t850 = sub i64 0, %t849
  store i64 %t850, ptr %local.py.378
  br label %loop47
loop47:
  %t851 = load i64, ptr %local.py.378
  %t852 = load i64, ptr %local.n_test.345
  %t853 = icmp sle i64 %t851, %t852
  %t854 = zext i1 %t853 to i64
  %t855 = icmp ne i64 %t854, 0
  br i1 %t855, label %body47, label %endloop47
body47:
  %t856 = load i64, ptr %local.n_test.345
  %t857 = sub i64 0, %t856
  store i64 %t857, ptr %local.pz.379
  br label %loop48
loop48:
  %t858 = load i64, ptr %local.pz.379
  %t859 = load i64, ptr %local.n_test.345
  %t860 = icmp sle i64 %t858, %t859
  %t861 = zext i1 %t860 to i64
  %t862 = icmp ne i64 %t861, 0
  br i1 %t862, label %body48, label %endloop48
body48:
  %t863 = load i64, ptr %local.px.377
  %t864 = load i64, ptr %local.py.378
  %t865 = load i64, ptr %local.pz.379
  %t866 = call i64 @"ksq"(i64 %t863, i64 %t864, i64 %t865)
  store i64 %t866, ptr %local.p2.380
  %t867 = load i64, ptr %local.p2.380
  %t868 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.120)
  %t869 = call i64 @"sx_f64_gt"(i64 %t867, i64 %t868)
  %t870 = icmp ne i64 %t869, 0
  br i1 %t870, label %then49, label %else49
then49:
  %t871 = load i64, ptr %local.k_mag.346
  %t872 = load i64, ptr %local.px.377
  %t873 = sub i64 %t871, %t872
  store i64 %t873, ptr %local.qx.381
  %t874 = load i64, ptr %local.py.378
  %t875 = sub i64 0, %t874
  store i64 %t875, ptr %local.qy.382
  %t876 = load i64, ptr %local.pz.379
  %t877 = sub i64 0, %t876
  store i64 %t877, ptr %local.qz.383
  %t878 = load i64, ptr %local.qx.381
  %t879 = load i64, ptr %local.qy.382
  %t880 = load i64, ptr %local.qz.383
  %t881 = call i64 @"ksq"(i64 %t878, i64 %t879, i64 %t880)
  store i64 %t881, ptr %local.q2.384
  %t882 = load i64, ptr %local.n_test.345
  %t883 = call i64 @"sx_int_to_f64"(i64 %t882)
  store i64 %t883, ptr %local.nf.385
  %t884 = load i64, ptr %local.q2.384
  %t885 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.121)
  %t886 = call i64 @"sx_f64_gt"(i64 %t884, i64 %t885)
  %t887 = icmp ne i64 %t886, 0
  br i1 %t887, label %then50, label %else50
then50:
  %t888 = load i64, ptr %local.q2.384
  %t889 = load i64, ptr %local.nf.385
  %t890 = load i64, ptr %local.nf.385
  %t891 = call i64 @"sx_f64_mul"(i64 %t889, i64 %t890)
  %t892 = call i64 @"sx_f64_le"(i64 %t888, i64 %t891)
  %t893 = icmp ne i64 %t892, 0
  br i1 %t893, label %then51, label %else51
then51:
  %t894 = load i64, ptr %local.without_leray.376
  %t895 = load i64, ptr %local.q2.384
  %t896 = call i64 @"sx_f64_add"(i64 %t894, i64 %t895)
  store i64 %t896, ptr %local.without_leray.376
  br label %then51_end
then51_end:
  br label %endif51
else51:
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t897 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  br label %then50_end
then50_end:
  br label %endif50
else50:
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t898 = phi i64 [ %t897, %then50_end ], [ 0, %else50_end ]
  br label %then49_end
then49_end:
  br label %endif49
else49:
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t899 = phi i64 [ %t898, %then49_end ], [ 0, %else49_end ]
  %t900 = load i64, ptr %local.pz.379
  %t901 = add i64 %t900, 1
  store i64 %t901, ptr %local.pz.379
  br label %loop48
endloop48:
  %t902 = load i64, ptr %local.py.378
  %t903 = add i64 %t902, 1
  store i64 %t903, ptr %local.py.378
  br label %loop47
endloop47:
  %t904 = load i64, ptr %local.px.377
  %t905 = add i64 %t904, 1
  store i64 %t905, ptr %local.px.377
  br label %loop46
endloop46:
  %t906 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.122)
  store i64 %t906, ptr %local.reduction.386
  %t907 = load i64, ptr %local.without_leray.376
  %t908 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.123)
  %t909 = call i64 @"sx_f64_gt"(i64 %t907, i64 %t908)
  %t910 = icmp ne i64 %t909, 0
  br i1 %t910, label %then52, label %else52
then52:
  %t911 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.124)
  %t912 = load i64, ptr %local.with_leray.375
  %t913 = load i64, ptr %local.without_leray.376
  %t914 = call i64 @"sx_f64_div"(i64 %t912, i64 %t913)
  %t915 = call i64 @"sx_f64_sub"(i64 %t911, i64 %t914)
  store i64 %t915, ptr %local.reduction.386
  br label %then52_end
then52_end:
  br label %endif52
else52:
  br label %else52_end
else52_end:
  br label %endif52
endif52:
  %t916 = phi i64 [ 0, %then52_end ], [ 0, %else52_end ]
  %t917 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.125)
  %t918 = ptrtoint ptr %t917 to i64
  %t919 = inttoptr i64 %t918 to ptr
  call void @intrinsic_print(ptr %t919)
  %t920 = load i64, ptr %local.k_mag.346
  call void @print_i64(i64 %t920)
  %t921 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.126)
  %t922 = ptrtoint ptr %t921 to i64
  %t923 = inttoptr i64 %t922 to ptr
  call void @intrinsic_print(ptr %t923)
  %t924 = load i64, ptr %local.with_leray.375
  %t925 = call i64 @"print_f64"(i64 %t924)
  %t926 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.127)
  %t927 = ptrtoint ptr %t926 to i64
  %t928 = inttoptr i64 %t927 to ptr
  call void @intrinsic_print(ptr %t928)
  %t929 = load i64, ptr %local.without_leray.376
  %t930 = call i64 @"print_f64"(i64 %t929)
  %t931 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.128)
  %t932 = ptrtoint ptr %t931 to i64
  %t933 = inttoptr i64 %t932 to ptr
  call void @intrinsic_print(ptr %t933)
  %t934 = load i64, ptr %local.reduction.386
  %t935 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.129)
  %t936 = call i64 @"sx_f64_mul"(i64 %t934, i64 %t935)
  %t937 = call i64 @"print_f64"(i64 %t936)
  %t938 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.130)
  %t939 = ptrtoint ptr %t938 to i64
  %t940 = inttoptr i64 %t939 to ptr
  call void @intrinsic_println(ptr %t940)
  %t941 = load i64, ptr %local.k_mag.346
  %t942 = add i64 %t941, 1
  store i64 %t942, ptr %local.k_mag.346
  br label %loop45
endloop45:
  %t943 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.131)
  %t944 = ptrtoint ptr %t943 to i64
  %t945 = inttoptr i64 %t944 to ptr
  call void @intrinsic_println(ptr %t945)
  %t946 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.132)
  %t947 = ptrtoint ptr %t946 to i64
  %t948 = inttoptr i64 %t947 to ptr
  call void @intrinsic_println(ptr %t948)
  %t949 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.133)
  %t950 = ptrtoint ptr %t949 to i64
  %t951 = inttoptr i64 %t950 to ptr
  call void @intrinsic_println(ptr %t951)
  %t952 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.134)
  %t953 = ptrtoint ptr %t952 to i64
  %t954 = inttoptr i64 %t953 to ptr
  call void @intrinsic_println(ptr %t954)
  %t955 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.135)
  %t956 = ptrtoint ptr %t955 to i64
  %t957 = inttoptr i64 %t956 to ptr
  call void @intrinsic_println(ptr %t957)
  store i64 2, ptr %local.n_val.387
  br label %loop53
loop53:
  %t958 = load i64, ptr %local.n_val.387
  %t959 = icmp sle i64 %t958, 8
  %t960 = zext i1 %t959 to i64
  %t961 = icmp ne i64 %t960, 0
  br i1 %t961, label %body53, label %endloop53
body53:
  %t962 = load i64, ptr %local.n_val.387
  %t963 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.136)
  %t964 = call i64 @"sum_coupling_for_k"(i64 1, i64 0, i64 0, i64 %t962, i64 %t963)
  store i64 %t964, ptr %local.s_str.388
  %t965 = load i64, ptr %local.nu.344
  %t966 = load i64, ptr %local.nu.344
  %t967 = call i64 @"sx_f64_mul"(i64 %t965, i64 %t966)
  store i64 %t967, ptr %local.s_dif.389
  %t968 = load i64, ptr %local.s_str.388
  %t969 = load i64, ptr %local.s_dif.389
  %t970 = call i64 @"sx_f64_div"(i64 %t968, i64 %t969)
  store i64 %t970, ptr %local.ratio.390
  %t971 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.137)
  %t972 = ptrtoint ptr %t971 to i64
  %t973 = inttoptr i64 %t972 to ptr
  call void @intrinsic_print(ptr %t973)
  %t974 = load i64, ptr %local.n_val.387
  call void @print_i64(i64 %t974)
  %t975 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.138)
  %t976 = ptrtoint ptr %t975 to i64
  %t977 = inttoptr i64 %t976 to ptr
  call void @intrinsic_print(ptr %t977)
  %t978 = load i64, ptr %local.s_str.388
  %t979 = call i64 @"print_f64"(i64 %t978)
  %t980 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.139)
  %t981 = ptrtoint ptr %t980 to i64
  %t982 = inttoptr i64 %t981 to ptr
  call void @intrinsic_print(ptr %t982)
  %t983 = load i64, ptr %local.s_dif.389
  %t984 = call i64 @"print_f64"(i64 %t983)
  %t985 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.140)
  %t986 = ptrtoint ptr %t985 to i64
  %t987 = inttoptr i64 %t986 to ptr
  call void @intrinsic_print(ptr %t987)
  %t988 = load i64, ptr %local.ratio.390
  %t989 = call i64 @"print_f64"(i64 %t988)
  %t990 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.141)
  %t991 = ptrtoint ptr %t990 to i64
  %t992 = inttoptr i64 %t991 to ptr
  call void @intrinsic_println(ptr %t992)
  %t993 = load i64, ptr %local.n_val.387
  %t994 = add i64 %t993, 1
  store i64 %t994, ptr %local.n_val.387
  br label %loop53
endloop53:
  %t995 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.142)
  %t996 = ptrtoint ptr %t995 to i64
  %t997 = inttoptr i64 %t996 to ptr
  call void @intrinsic_println(ptr %t997)
  %t998 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.143)
  %t999 = ptrtoint ptr %t998 to i64
  %t1000 = inttoptr i64 %t999 to ptr
  call void @intrinsic_println(ptr %t1000)
  %t1001 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.144)
  %t1002 = ptrtoint ptr %t1001 to i64
  %t1003 = inttoptr i64 %t1002 to ptr
  call void @intrinsic_println(ptr %t1003)
  %t1004 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.145)
  %t1005 = ptrtoint ptr %t1004 to i64
  %t1006 = inttoptr i64 %t1005 to ptr
  call void @intrinsic_println(ptr %t1006)
  %t1007 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.146)
  %t1008 = ptrtoint ptr %t1007 to i64
  %t1009 = inttoptr i64 %t1008 to ptr
  call void @intrinsic_println(ptr %t1009)
  %t1010 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.147)
  %t1011 = ptrtoint ptr %t1010 to i64
  %t1012 = inttoptr i64 %t1011 to ptr
  call void @intrinsic_println(ptr %t1012)
  %t1013 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.148)
  %t1014 = ptrtoint ptr %t1013 to i64
  %t1015 = inttoptr i64 %t1014 to ptr
  call void @intrinsic_println(ptr %t1015)
  %t1016 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.149)
  %t1017 = ptrtoint ptr %t1016 to i64
  %t1018 = inttoptr i64 %t1017 to ptr
  call void @intrinsic_println(ptr %t1018)
  %t1019 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.150)
  %t1020 = ptrtoint ptr %t1019 to i64
  %t1021 = inttoptr i64 %t1020 to ptr
  call void @intrinsic_println(ptr %t1021)
  %t1022 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.151)
  %t1023 = ptrtoint ptr %t1022 to i64
  %t1024 = inttoptr i64 %t1023 to ptr
  call void @intrinsic_println(ptr %t1024)
  %t1025 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.152)
  %t1026 = ptrtoint ptr %t1025 to i64
  %t1027 = inttoptr i64 %t1026 to ptr
  call void @intrinsic_println(ptr %t1027)
  %t1028 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.153)
  %t1029 = ptrtoint ptr %t1028 to i64
  %t1030 = inttoptr i64 %t1029 to ptr
  call void @intrinsic_println(ptr %t1030)
  %t1031 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.154)
  %t1032 = ptrtoint ptr %t1031 to i64
  %t1033 = inttoptr i64 %t1032 to ptr
  call void @intrinsic_println(ptr %t1033)
  %t1034 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.155)
  %t1035 = ptrtoint ptr %t1034 to i64
  %t1036 = inttoptr i64 %t1035 to ptr
  call void @intrinsic_println(ptr %t1036)
  %t1037 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.156)
  %t1038 = ptrtoint ptr %t1037 to i64
  %t1039 = inttoptr i64 %t1038 to ptr
  call void @intrinsic_println(ptr %t1039)
  %t1040 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.157)
  %t1041 = ptrtoint ptr %t1040 to i64
  %t1042 = inttoptr i64 %t1041 to ptr
  call void @intrinsic_println(ptr %t1042)
  %t1043 = load i64, ptr %local.r_vals_1.347
  %t1044 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.158)
  %t1045 = call i64 @"sx_f64_gt"(i64 %t1043, i64 %t1044)
  %t1046 = icmp ne i64 %t1045, 0
  br i1 %t1046, label %then54, label %else54
then54:
  %t1047 = load i64, ptr %local.r_vals_8.354
  %t1048 = call i64 @f64_parse(ptr @.str.exp_ns_continuum_coupling.159)
  %t1049 = call i64 @"sx_f64_gt"(i64 %t1047, i64 %t1048)
  %t1050 = icmp ne i64 %t1049, 0
  br i1 %t1050, label %then55, label %else55
then55:
  %t1051 = load i64, ptr %local.r_vals_8.354
  %t1052 = load i64, ptr %local.r_vals_1.347
  %t1053 = call i64 @"sx_f64_lt"(i64 %t1051, i64 %t1052)
  %t1054 = icmp ne i64 %t1053, 0
  br i1 %t1054, label %then56, label %else56
then56:
  %t1055 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.160)
  %t1056 = ptrtoint ptr %t1055 to i64
  %t1057 = inttoptr i64 %t1056 to ptr
  call void @intrinsic_println(ptr %t1057)
  %t1058 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.161)
  %t1059 = ptrtoint ptr %t1058 to i64
  %t1060 = inttoptr i64 %t1059 to ptr
  call void @intrinsic_print(ptr %t1060)
  %t1061 = load i64, ptr %local.r_vals_1.347
  %t1062 = call i64 @"print_f64"(i64 %t1061)
  %t1063 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.162)
  %t1064 = ptrtoint ptr %t1063 to i64
  %t1065 = inttoptr i64 %t1064 to ptr
  call void @intrinsic_print(ptr %t1065)
  %t1066 = load i64, ptr %local.r_vals_8.354
  %t1067 = call i64 @"print_f64"(i64 %t1066)
  %t1068 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.163)
  %t1069 = ptrtoint ptr %t1068 to i64
  %t1070 = inttoptr i64 %t1069 to ptr
  call void @intrinsic_println(ptr %t1070)
  %t1071 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.164)
  %t1072 = ptrtoint ptr %t1071 to i64
  %t1073 = inttoptr i64 %t1072 to ptr
  call void @intrinsic_print(ptr %t1073)
  %t1074 = load i64, ptr %local.r_vals_1.347
  %t1075 = load i64, ptr %local.r_vals_8.354
  %t1076 = call i64 @"sx_f64_div"(i64 %t1074, i64 %t1075)
  %t1077 = call i64 @"print_f64"(i64 %t1076)
  %t1078 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.165)
  %t1079 = ptrtoint ptr %t1078 to i64
  %t1080 = inttoptr i64 %t1079 to ptr
  call void @intrinsic_println(ptr %t1080)
  br label %then56_end
then56_end:
  br label %endif56
else56:
  %t1081 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.166)
  %t1082 = ptrtoint ptr %t1081 to i64
  %t1083 = inttoptr i64 %t1082 to ptr
  call void @intrinsic_println(ptr %t1083)
  br label %else56_end
else56_end:
  br label %endif56
endif56:
  %t1084 = phi i64 [ 0, %then56_end ], [ 0, %else56_end ]
  br label %then55_end
then55_end:
  br label %endif55
else55:
  br label %else55_end
else55_end:
  br label %endif55
endif55:
  %t1085 = phi i64 [ %t1084, %then55_end ], [ 0, %else55_end ]
  br label %then54_end
then54_end:
  br label %endif54
else54:
  br label %else54_end
else54_end:
  br label %endif54
endif54:
  %t1086 = phi i64 [ %t1085, %then54_end ], [ 0, %else54_end ]
  %t1087 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.167)
  %t1088 = ptrtoint ptr %t1087 to i64
  %t1089 = inttoptr i64 %t1088 to ptr
  call void @intrinsic_println(ptr %t1089)
  %t1090 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.168)
  %t1091 = ptrtoint ptr %t1090 to i64
  %t1092 = inttoptr i64 %t1091 to ptr
  call void @intrinsic_println(ptr %t1092)
  %t1093 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.169)
  %t1094 = ptrtoint ptr %t1093 to i64
  %t1095 = inttoptr i64 %t1094 to ptr
  call void @intrinsic_println(ptr %t1095)
  %t1096 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_continuum_coupling.170)
  %t1097 = ptrtoint ptr %t1096 to i64
  %t1098 = inttoptr i64 %t1097 to ptr
  call void @intrinsic_println(ptr %t1098)
  ret i64 0
}


; String constants
@.str.exp_ns_continuum_coupling.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.4 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_continuum_coupling.5 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_continuum_coupling.6 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_continuum_coupling.7 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.8 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_continuum_coupling.9 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.10 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_continuum_coupling.11 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.12 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_continuum_coupling.13 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_continuum_coupling.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.15 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_continuum_coupling.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.17 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_continuum_coupling.18 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_continuum_coupling.19 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_continuum_coupling.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.21 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_continuum_coupling.22 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_continuum_coupling.23 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_continuum_coupling.24 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_continuum_coupling.25 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_continuum_coupling.26 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_continuum_coupling.27 = private unnamed_addr constant [61 x i8] c"#  CONTINUUM COUPLING: Exact 3D NS Fourier Coefficients    #\00"
@.str.exp_ns_continuum_coupling.28 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_continuum_coupling.29 = private unnamed_addr constant [61 x i8] c"#  For each |k|, compute:                                  #\00"
@.str.exp_ns_continuum_coupling.30 = private unnamed_addr constant [60 x i8] c"#    S_stretch(k) = sum |c_{k,p,q}|^2 over all triads     #\00"
@.str.exp_ns_continuum_coupling.31 = private unnamed_addr constant [60 x i8] c"#    R(k) = S_stretch(k) / (nu^2 * k^4)                   #\00"
@.str.exp_ns_continuum_coupling.32 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_continuum_coupling.33 = private unnamed_addr constant [61 x i8] c"#  If R(k) decays with k:                                  #\00"
@.str.exp_ns_continuum_coupling.34 = private unnamed_addr constant [61 x i8] c"#    geometric decay holds in EXACT Fourier basis          #\00"
@.str.exp_ns_continuum_coupling.35 = private unnamed_addr constant [61 x i8] c"#    NOT an artefact of the simplified Galerkin model      #\00"
@.str.exp_ns_continuum_coupling.36 = private unnamed_addr constant [61 x i8] c"#    the proof chain CLOSES                                #\00"
@.str.exp_ns_continuum_coupling.37 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_continuum_coupling.38 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.39 = private unnamed_addr constant [67 x i8] c"  === Phase 1: Per-wavenumber coupling (N=8, s=0, L2 spectrum) ===\00"
@.str.exp_ns_continuum_coupling.40 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.41 = private unnamed_addr constant [62 x i8] c"  |k|    S_stretch      nu^2*k^4       R(k)           #triads\00"
@.str.exp_ns_continuum_coupling.42 = private unnamed_addr constant [62 x i8] c"  ----   ----------     ----------     ----------     -------\00"
@.str.exp_ns_continuum_coupling.43 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.44 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.45 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.46 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.47 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.48 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.49 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.50 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.51 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.52 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.53 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.54 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_continuum_coupling.55 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_continuum_coupling.56 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_continuum_coupling.57 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_continuum_coupling.58 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_continuum_coupling.59 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.60 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.61 = private unnamed_addr constant [32 x i8] c"  Power law fit: R(k) ~ k^alpha\00"
@.str.exp_ns_continuum_coupling.62 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.63 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.64 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.65 = private unnamed_addr constant [10 x i8] c"  R(1) = \00"
@.str.exp_ns_continuum_coupling.66 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.67 = private unnamed_addr constant [10 x i8] c"  R(2) = \00"
@.str.exp_ns_continuum_coupling.68 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.69 = private unnamed_addr constant [10 x i8] c"  R(4) = \00"
@.str.exp_ns_continuum_coupling.70 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.71 = private unnamed_addr constant [10 x i8] c"  R(8) = \00"
@.str.exp_ns_continuum_coupling.72 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.73 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.74 = private unnamed_addr constant [15 x i8] c"  R(2)/R(1) = \00"
@.str.exp_ns_continuum_coupling.75 = private unnamed_addr constant [28 x i8] c" (per-octave decay, k=1->2)\00"
@.str.exp_ns_continuum_coupling.76 = private unnamed_addr constant [15 x i8] c"  R(4)/R(2) = \00"
@.str.exp_ns_continuum_coupling.77 = private unnamed_addr constant [28 x i8] c" (per-octave decay, k=2->4)\00"
@.str.exp_ns_continuum_coupling.78 = private unnamed_addr constant [15 x i8] c"  R(8)/R(4) = \00"
@.str.exp_ns_continuum_coupling.79 = private unnamed_addr constant [28 x i8] c" (per-octave decay, k=4->8)\00"
@.str.exp_ns_continuum_coupling.80 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.81 = private unnamed_addr constant [67 x i8] c"  === Phase 2: Per-wavenumber coupling (N=8, s=1, H1 spectrum) ===\00"
@.str.exp_ns_continuum_coupling.82 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.83 = private unnamed_addr constant [62 x i8] c"  |k|    S_stretch      nu^2*k^4       R(k)           #triads\00"
@.str.exp_ns_continuum_coupling.84 = private unnamed_addr constant [62 x i8] c"  ----   ----------     ----------     ----------     -------\00"
@.str.exp_ns_continuum_coupling.85 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.86 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.87 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.88 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.89 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_continuum_coupling.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.91 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.92 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_continuum_coupling.93 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_continuum_coupling.94 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_continuum_coupling.95 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_continuum_coupling.96 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_continuum_coupling.97 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.98 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.99 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.100 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.101 = private unnamed_addr constant [19 x i8] c"  H1: R(2)/R(1) = \00"
@.str.exp_ns_continuum_coupling.102 = private unnamed_addr constant [28 x i8] c" (per-octave decay, k=1->2)\00"
@.str.exp_ns_continuum_coupling.103 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.104 = private unnamed_addr constant [19 x i8] c"  H1: R(4)/R(2) = \00"
@.str.exp_ns_continuum_coupling.105 = private unnamed_addr constant [28 x i8] c" (per-octave decay, k=2->4)\00"
@.str.exp_ns_continuum_coupling.106 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.107 = private unnamed_addr constant [19 x i8] c"  H1: R(8)/R(4) = \00"
@.str.exp_ns_continuum_coupling.108 = private unnamed_addr constant [28 x i8] c" (per-octave decay, k=4->8)\00"
@.str.exp_ns_continuum_coupling.109 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.110 = private unnamed_addr constant [49 x i8] c"  === Phase 3: Leray projection cancellation ===\00"
@.str.exp_ns_continuum_coupling.111 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.112 = private unnamed_addr constant [50 x i8] c"  For each |k|, compare coupling WITH and WITHOUT\00"
@.str.exp_ns_continuum_coupling.113 = private unnamed_addr constant [52 x i8] c"  the sin^2(q,k) Leray factor. The difference shows\00"
@.str.exp_ns_continuum_coupling.114 = private unnamed_addr constant [49 x i8] c"  how much incompressibility reduces stretching.\00"
@.str.exp_ns_continuum_coupling.115 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.116 = private unnamed_addr constant [49 x i8] c"  |k|    With Leray     Without Leray  Reduction\00"
@.str.exp_ns_continuum_coupling.117 = private unnamed_addr constant [49 x i8] c"  ----   ----------     ----------     ---------\00"
@.str.exp_ns_continuum_coupling.118 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.119 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.120 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_continuum_coupling.121 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_continuum_coupling.122 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.123 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.124 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_continuum_coupling.125 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_continuum_coupling.126 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_continuum_coupling.127 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_continuum_coupling.128 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_continuum_coupling.129 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_ns_continuum_coupling.130 = private unnamed_addr constant [2 x i8] c"%\00"
@.str.exp_ns_continuum_coupling.131 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.132 = private unnamed_addr constant [45 x i8] c"  === Phase 4: N-dependence at fixed k=1 ===\00"
@.str.exp_ns_continuum_coupling.133 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.134 = private unnamed_addr constant [46 x i8] c"  N      S_stretch(1)   nu^2*1^4       R(1,N)\00"
@.str.exp_ns_continuum_coupling.135 = private unnamed_addr constant [50 x i8] c"  ----   ----------     ----------     ----------\00"
@.str.exp_ns_continuum_coupling.136 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.137 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_continuum_coupling.138 = private unnamed_addr constant [5 x i8] c"    \00"
@.str.exp_ns_continuum_coupling.139 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_continuum_coupling.140 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_continuum_coupling.141 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.142 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.143 = private unnamed_addr constant [30 x i8] c"  === Phase 5: Assessment ===\00"
@.str.exp_ns_continuum_coupling.144 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.145 = private unnamed_addr constant [43 x i8] c"  KEY RESULT: If R(k) decays with k, then:\00"
@.str.exp_ns_continuum_coupling.146 = private unnamed_addr constant [65 x i8] c"    - The geometric decay of coupling is NOT a Galerkin artefact\00"
@.str.exp_ns_continuum_coupling.147 = private unnamed_addr constant [58 x i8] c"    - It is a structural property of the NS Fourier basis\00"
@.str.exp_ns_continuum_coupling.148 = private unnamed_addr constant [51 x i8] c"    - The sin^2(q,k) Leray factor is the mechanism\00"
@.str.exp_ns_continuum_coupling.149 = private unnamed_addr constant [53 x i8] c"    - Incompressibility CAUSES the coupling to decay\00"
@.str.exp_ns_continuum_coupling.150 = private unnamed_addr constant [58 x i8] c"    - This is the structural property that Tao's averaged\00"
@.str.exp_ns_continuum_coupling.151 = private unnamed_addr constant [54 x i8] c"      equations break (they remove incompressibility)\00"
@.str.exp_ns_continuum_coupling.152 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.153 = private unnamed_addr constant [49 x i8] c"  If R(k) decays AND R(k=1, N) saturates with N:\00"
@.str.exp_ns_continuum_coupling.154 = private unnamed_addr constant [37 x i8] c"    - The continuum limit is bounded\00"
@.str.exp_ns_continuum_coupling.155 = private unnamed_addr constant [29 x i8] c"    - The proof chain closes\00"
@.str.exp_ns_continuum_coupling.156 = private unnamed_addr constant [38 x i8] c"    - A*_inf > 0 follows analytically\00"
@.str.exp_ns_continuum_coupling.157 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.158 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.159 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_continuum_coupling.160 = private unnamed_addr constant [25 x i8] c"  R(k) DECAYS with k ✓\00"
@.str.exp_ns_continuum_coupling.161 = private unnamed_addr constant [12 x i8] c"    R(1) = \00"
@.str.exp_ns_continuum_coupling.162 = private unnamed_addr constant [10 x i8] c", R(8) = \00"
@.str.exp_ns_continuum_coupling.163 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.164 = private unnamed_addr constant [19 x i8] c"    Decay factor: \00"
@.str.exp_ns_continuum_coupling.165 = private unnamed_addr constant [18 x i8] c"x from k=1 to k=8\00"
@.str.exp_ns_continuum_coupling.166 = private unnamed_addr constant [38 x i8] c"  WARNING: R(k) does NOT decay with k\00"
@.str.exp_ns_continuum_coupling.167 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_continuum_coupling.168 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_continuum_coupling.169 = private unnamed_addr constant [61 x i8] c"#  CONTINUUM COUPLING COMPLETE                             #\00"
@.str.exp_ns_continuum_coupling.170 = private unnamed_addr constant [61 x i8] c"############################################################\00"
